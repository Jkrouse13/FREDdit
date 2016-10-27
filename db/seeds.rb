# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  Post.create!(
    vote: rand(400..800),
    title: Faker::StarWars.quote,
    link: Faker::Internet.url,
    author: Faker::GameOfThrones.character
  )
end
