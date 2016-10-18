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
      object = tag.capitalize.constantize.includes(:requests).where(requests: {id: self})
      if object.present?
        object.first.name
      else
        I18n.t("#{tag}", scope: 'tags')
      end
    end
  end

  # def check_attribute_present(tag)
  #   object = tag.capitalize.constantize.includes(:requests).where(requests: {id: self})
  #   object.present?
  # end

  def check_tags_sufficient(params)
    arr = []
    TAGS.each do |tag|
      if params["#{tag}_id"].length > 0
        arr << params["#{tag}_id"]
      end
    end
    arr.compact!
    arr.length >= 3
  end

end
