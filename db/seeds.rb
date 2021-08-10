# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
Parking.destroy_all


20.times do
    p = Parking.create(
    price: rand(30000..400000),
    description: Faker::Lorem.sentence(word_count: 25),
    size: rand(1..3),
    town: Faker::Address.state,
    city: Faker::Address.city,
    address: Faker::Address.street_address,
    user_id: 6
)

    p.image.attach(io: File.open('public/wp4896663.jpg'), filename: 'wp4896663.jpg')




end