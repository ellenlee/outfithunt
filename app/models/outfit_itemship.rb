class OutfitItemship < ApplicationRecord
	belongs_to :outfit
	belongs_to :item
end
