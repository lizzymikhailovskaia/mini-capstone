# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
20.times do
  product = Product.create(name: Faker::Cat.breed, price: Faker::Number.decimal(2), image: Faker::Fillmurray.image, description: Faker::Cat.registry)
end







