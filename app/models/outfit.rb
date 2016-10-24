class Outfit < ApplicationRecord

	belongs_to :image, optional: true
	has_many :outfit_itemships, dependent: :destroy
	has_many :items, through: :outfit_itemships
	has_many :item_images, through: :items, source: :images

	has_many :outfit_occasionships, dependent: :destroy
	has_many :occasions, through: :outfit_occasionships

	has_many :colors, through: :items
	has_many :materials, through: :items
	has_many :categories, through: :items
	has_many :styles, through: :items
	has_many :brands, through: :items

	has_many :collections, dependent: :destroy
  has_many :collected_outfits, through: :collections, source: :user

	def related_item(request)
		item = self.items.where(color: request.color, category: request.category) || self.items.related_item(request)
		if item.present?
			item.first
		end
	end

	def self.related_list(request)
		items = Item.related_list_by_tags(request)
		outfits = []
		items.each do |item|
			outfits += item.outfits
		end
		outfits.uniq!
	end

	def image_url
		if self.image
			self.image.file_path
		else
			"-"
		end
	end

	def self.import(file)
		update_cases = []
		new_cases = []
		success_cases = []
		fail_cases = []

		image_index = Image.get_all_file_name
		occasion_index = Occasion.all.pluck(:name)

		CSV.foreach(file.path, headers: true) do |row|
			outfit_hash = row.to_hash
			filename = outfit_hash["filename"]

			# Create or find Outfit?
			outfit = Outfit.find_or_create_by!(name: filename)
			if outfit.persisted?
				update_cases << outfit.name
			else
				new_cases << "#{outfit.name} 已新增"
			end

			# get related items
			images = []
			image_index.each do |img_name|
				if outfit_hash[img_name] != nil
					images << img_name
				end
			end
			related_items = Item.find_by_image_file_names(images)
			# build relationship
			related_items.each do |item|
				if !outfit.items.include?(item)
					outfit.items << item
					success_cases << "#{item.name} 已加入 #{outfit.name}"
				else
					# update or ignore
			 		fail_cases << outfit.name
				end
			end

			# Create or find image? If no file, use default picture.
			image = Image.connect_to_file("outfits", filename)
			image = Image.find_by_name("default") if image == false

			if outfit.image != image
				outfit.image = image
				outfit.save
				success_cases << "#{outfit.name} 更新圖檔 #{image.name}"
			end

			occasions = []
			occasion_index.each do |name|
				if outfit_hash[name] != nil
					occasions << Occasion.find_by_name(name)
				end
			end
			occasions.each do |occ|
				if !outfit.occasions.include?(occ)
					outfit.occasions << occ
				end
			end
		end
		msg = "#{new_cases.to_sentence} | #{success_cases.to_sentence}"
	end
end
