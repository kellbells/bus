# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

3.times do
  Restaurant.create(name: Faker::Name.first_name)
end

Restaurant.all.each do |p|
    6.times do
    dish = p.dishes.create(plate: Faker::Name.last_name)
    10.times do
    dish.ingredients.create(name: Faker::Name.last_name)
    1.times do
    side_dish = dish.side_dishes.create(name:Faker::Name.first_name)
    5.times do
    side_dish.side_ingredients.create(name:Faker::Name.last_name)
  end
  end
  end
  end
end
