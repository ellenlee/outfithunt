# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Color.create!(name: '粉紅')
Color.create!(name: '黑')
Color.create!(name: '黃')
Color.create!(name: '藍')

Material.create!(name:"絲質")
Material.create!(name:"麻")

Category.create!(name:"外套")
Category.create!(name:"裙子")