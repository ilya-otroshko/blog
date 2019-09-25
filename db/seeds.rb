# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.create(
    login: Faker::Internet.username, 
    email: Faker::Internet.email, 
    password: "123456", 
    password_confirmation: "123456", 
    remote_image_url: Faker::Avatar.image)

10.times do

<<<<<<< HEAD
    User.create(login: Faker::Internet.username, email: Faker::Internet.email, password: "123456", password_confirmation: "123456",  image:Faker::Avatar.image)

    # Post.create(title: Faker::Food.dish, body: Faker::Lorem.paragraph(sentence_count: 15, supplemental: true), user_id: rand(User.first.id...User.last.id),  images:[Rails.root.join("public/uploads/user/image/avatar.png").open])
=======
    User.create(
        login: Faker::Internet.username, 
        email: Faker::Internet.email, 
        password: "123456", 
        password_confirmation: "123456", 
        remote_image_url: Faker::Avatar.image)

    Post.create(
        title: Faker::Food.dish, 
        body: Faker::Lorem.paragraph(sentence_count: 15, supplemental: true), 
        user_id: rand(User.first.id...User.last.id))
>>>>>>> a3dff12ce750d0002ed55ea9d5115cf7835c1e92

rand(1...4).times do
    Document.create(
        remote_path_url: Faker::Avatar.image, 
        documentable_id: Post.last.id, 
        documentable_type: "Post")
    end
end