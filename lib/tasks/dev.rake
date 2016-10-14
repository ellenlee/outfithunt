namespace :dev do 

	task create_item: :environment do
		Item.delete_all
		puts "start creating items"
		30.times do |i|
			i += 1
			item = Item.new( name: "item"+i.to_s,
											 color: Color.all.sample(1).first, 
											 material: Material.all.sample(1).first,
											 category: Category.all.sample(1).first )
			if item.save!
				puts "create #{item.name}"
			end
		end
		puts "finished"
	end

	task create_outfit: :environment do
		Outfit.delete_all
		puts "start creating outfits"
		10.times do |i|
			i = i+1
			outfit = Outfit.new( name: "outfit"+i.to_s )
			outfit.save!
			outfit.items << Item.all.sample(3)

			puts "create #{outfit.name}"
		end
		puts "finished"
	end

	

end