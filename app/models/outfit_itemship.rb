class OutfitItemship < ApplicationRecord
  validates_uniqueness_of :item_id, scope: :outfit_id

	belongs_to :outfit
	belongs_to :item
end
