class Image < ApplicationRecord
	# mount_uploader :img, ImgUploader

	has_many :item_imageships, dependent: :destroy
	has_many :items, through: :item_imageships

  FILE_TYPE = [".jpg", ".jpeg", ".git", ".png"]

  def self.get_all_file_name
    image_file_names = []
    images = Image.where("file_path LIKE 'items/%'")
    images.each do |img|
      image_file_names << img.file_path.split("/").last
    end
    image_file_names
  end

  def self.connect_to_file(dir, filename)
    path = "app/assets/images/"+dir+"/"
    file_existence = false

    if filename.include?(".")
      file_existence = File.exist?(path+filename)
    else
      FILE_TYPE.each do |type|
        if File.exist?(path+filename+type)
          file_existence = true
          filename += type
        end
      end
    end
    if file_existence
      image = Image.find_or_create_by(file_path: dir+"/"+filename)
      image.name = filename
      image.save
      return image
    else
      false
    end
  end
end
