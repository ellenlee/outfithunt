class Item < ApplicationRecord
	# mount_uploader :img, ImgUploader

	belongs_to :brand
	belongs_to :color
	belongs_to :style
	belongs_to :material
	belongs_to :category

	has_many :outfit_itemships, dependent: :destroy
	has_many :outfits, through: :outfit_itemships

	has_many :item_imageships, dependent: :destroy
	has_many :images, through: :item_imageships, dependent: :destroy

	TAGS = ["brand", "color", 'style', 'category', 'material']

	TAGS.each do |tag|
		define_method "#{tag}_name" do
			object = tag.capitalize.constantize.includes(:items).where(items: {id: self})
			if object.present?
				object.first.name
			else
				"-"
			end
		end
	end

	def self.generate_lists_by_tags(request)
		items ={1=>[],2=>[],3=>[],4=>[]}

		related_items = Item.where("color_id = ? or category_id =? or style_id =? or material_id =?", color, category, style, material)
		related_items.each do |item|
			n = 0
			n += 1 if item.color == request.color
			n += 1 if item.category == request.category
			n += 1 if item.style == request.style
			n += 1 if item.material == request.material
			items[n] << item
		end
	end

	def self.find_by_image_file_name(file_name)
		self.includes(:images).where(images: {file_path: "items/"+file_name})
	end

	def self.find_by_image_file_names(arr)
		items = []
		arr.each do |file_name|
			item_list = self.find_by_image_file_name(file_name)
			item_list.each {|i| items << i }
		end
		items
	end

	def self.import(file)
		update_cases = []
		new_cases = []
		success_cases = []
		fail_cases = []

		CSV.foreach(file.path, headers: true) do |row|
			item_hash = row.to_hash
			item_name = item_hash["name"]
			filename = item_hash["filename"]

			# Create or find Item?
			item = Item.find_or_initialize_by(name: item_name)
			item.price = item_hash["price"].to_i
			item.save
			if item.persisted?
				update_cases << item.name
			else
				new_cases << item.name
			end

			# Create or find image? If no file, use default picture.
			image = Image.connect_to_file("items", filename)
			image = Image.find_by_name("default") if image == false

			# Create Item_imageships?
			if !item.images.include?(image)
				item.images << image
				success_cases << filename
			else
				# update or ignore
				fail_cases << filename
			end

			# Create or find color, style, material, category or brand

			attributes = ["color", "style", "material", "category", "brand"]
			attributes.each do |attribute|
				object = attribute.capitalize.constantize.find_or_create_by(name: item_hash[attribute])
				item.update( attribute.to_sym => object)
			end
		end

		msg = "新增單品 : #{new_cases.to_sentence} ｜ 修改單品 : #{update_cases.to_sentence} ｜ 新增單品圖檔 : #{success_cases.to_sentence} ｜ 圖檔已存在 : #{fail_cases.to_sentence}"

	end

end
