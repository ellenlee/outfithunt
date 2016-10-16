class Occasion < ApplicationRecord

  has_many :outfit_occasionships, dependent: :destroy
  has_many :outfits, through: :outfit_occasionships

end
