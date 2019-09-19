# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

10.times do

    User.create(login: Faker::Internet.username, email: Faker::Internet.email, password: "123456", password_confirmation: "123456", 
    remote_image_url: Faker::Avatar.image)

    Post.create(title: Faker::Food.dish, body: Faker::Lorem.paragraph(sentence_count: 15, supplemental: true), 
    user_id: rand(User.first.id...User.last.id), remote_image_url:Faker::Avatar.image)

end