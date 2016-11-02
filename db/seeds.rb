# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do
  User.create!(
    name: Faker::GameOfThrones.character + "#{rand(1..100)}",
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
    title: Faker::Team.name,
    link: Faker::Internet.url,
    user: User.all.sample,
    summary: Faker::StarWars.quote,
    subfred_id: Subfred.all.sample.id
  )
end

100.times do
  Vote.create!(
  post_id:  Post.all.sample.id,
  user_id: User.all.sample.id
  )
end

Post.all.each do |post|
  post.vote_count = post.votes.count.to_i
  post.save
end

10.times do
  Tag.create!(
  name: Faker::StarWars.specie
  )
end
  30.times do
    Tagging.create!(
    tag: Tag.all.sample,
    post: Post.all.sample
    )
  end
