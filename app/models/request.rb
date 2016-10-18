class Request < ApplicationRecord
	# validates_presence_of :color_id, :material_id, :category_id

	belongs_to :user
	belongs_to :color, optional: true
	belongs_to :material, optional: true
	belongs_to :category, optional: true
  belongs_to :style, optional: true

	mount_uploader :img, ImgUploader

  TAGS = ["color", 'style', 'category', 'material']

  TAGS.each do |tag|
    define_method "#{tag}_name" do
      object = tag.capitalize.constantize.includes(:items).where(items: {id: self})
      if object.present?
        object.first.name
      else
        "#{tag}"
      end
    end
  end
end
