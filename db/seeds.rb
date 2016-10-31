# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do
  User.create!(
    name: Faker::GameOfThrones.character,
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
end

3.times do
  Subfred.create!(
  name: Faker::StarWars.planet
  )
end

10.times do
  Post.create!(
    title: Faker::StarWars.quote,
    link: Faker::Internet.url,
    user_id: rand(1..5),
    summary: Faker::Team.name,
    subfred_id: rand(1..3)
  )
end

100.times do
  Vote.create!(
  post_id: rand(1..10),
  user_id: rand(1..5)
  )
end
