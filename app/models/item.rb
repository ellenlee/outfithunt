class Item < ApplicationRecord
	belongs_to :color
	belongs_to :material
	belongs_to :category

	has_many :outfit_itemships, dependent: :destroy
	has_many :outfits, through: :outfit_itemships

	def self.import(file)
		byebug
	end
end
