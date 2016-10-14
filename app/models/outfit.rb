class Outfit < ApplicationRecord
	has_many :outfit_itemships, dependent: :destroy
	has_many :items, through: :outfit_itemships

	has_many :colors, through: :items
	has_many :materials, through: :items
	has_many :categories, through: :items

	def related_item(request)
		item = self.items.where(color: request.color, material: request.material, category: request.category)
		if item.present?
			item.first
		end
	end
end
