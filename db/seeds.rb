# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
OrderItem.destroy_all
Order.destroy_all
Parking.destroy_all

full_address = [
            "tobago 1381, vitacura", "padre hurtado sur 302, las condes", "miraflores 106, buin", "los lingues 10840, el bosque", "el acero 10983, la florida",
            "las azaleas 4521, la florida, santiago", "tenaun 1621, cerro navia", "toroya 2761, puente alto", "Jose Miguel Carrera 3204, San Miguel",
            "Américo Vespucio 1501, Cerrillos"
        ]


20.times do
    p = Parking.create(
    price: rand(30000..400000),
    description: Faker::Lorem.sentence(word_count: 25),
    size: rand(1..3),
    address: full_address.sample,
    user_id: 1
)

    p.image.attach(io: File.open('public/wp4896663.jpg'), filename: 'wp4896663.jpg')

end