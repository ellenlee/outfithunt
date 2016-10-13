class Outfit < ApplicationRecord
	has_many :outfit_itemships, dependent: :destroy
	has_many :items, through: :outfit_itemships
end
