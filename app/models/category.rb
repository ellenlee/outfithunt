class Category < ApplicationRecord
	has_many :items
	has_many :outfits, through: :items
end
