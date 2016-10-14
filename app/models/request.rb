class Request < ApplicationRecord
	validates_presence_of :color_id, :material_id, :category_id

	belongs_to :color
	belongs_to :material
	belongs_to :category
end
