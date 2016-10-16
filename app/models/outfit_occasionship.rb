class OutfitOccasionship < ApplicationRecord
  validates_uniqueness_of :occasion_id, scope: :outfit_id

  belongs_to :outfit
  belongs_to :occasion

end
