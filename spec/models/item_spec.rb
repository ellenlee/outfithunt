require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    Color.create!(name: "white")
    Color.create!(name: "black")
    Color.create!(name: "red")

    Style.create!(name: "style 1")
    Style.create!(name: "style 2")
    Style.create!(name: "style 3")

    Material.create!(name: "m1")
    Material.create!(name: "m2")
    Material.create!(name: "m3")

    Category.create!(name: "c1")
    Category.create!(name: "c2")
    Category.create!(name: "c3")

    10.times { |i| Item.create!(name: "item_"+i.to_s), color: Color.first, material: Material.first, category: Category.first, style: Style.first}
    5.times do |o|
      outfit = Outfit.create!( name: "outfit_"+o.to_s )
      outfit.items << Item.all.sample(3)
    end

  end
  pending "add some examples to (or delete) #{__FILE__}"
end