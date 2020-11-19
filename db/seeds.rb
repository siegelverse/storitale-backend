# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all 
Genre.destroy_all 
Story.destroy_all 
Review.destroy_all 


User.create(id: 1, username: "markitos", email: "markitos@markitos.com", password_digest: "123")

User.create(id: 2, username: "snackboi", email: "snackboi@markitos.com", password_digest: "abc")

Genre.create(id: 1, label: "Drama")

Story.create(id: 1, title: "amazing story", body: "there once a little boi named snackert he sux lmao", location: "Austin Texas", genre_id: 1, user_id: 1)

Review.create(id: 1, content: "a heartwarming tale i love it so much!", rating: 5, user_id: 2, story_id: 1)

puts "db seeded!"