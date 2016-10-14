class Outfit < ApplicationRecord
	has_many :outfit_itemships, dependent: :destroy
	has_many :items, through: :outfit_itemships

	has_many :colors, through: :items
	has_many :materials, through: :items
	has_many :categories, through: :items
end
