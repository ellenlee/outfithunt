class ItemImageship < ApplicationRecord
  validates_uniqueness_of :image_id, scope: :item_id

	belongs_to :item, optional: true
	belongs_to :image
end
