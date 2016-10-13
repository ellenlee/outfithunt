class Request < ApplicationRecord
	belongs_to :color
	belongs_to :material
	belongs_to :category
end
