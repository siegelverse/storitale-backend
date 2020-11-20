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


markitos = User.create(username: "markitos", email: "markitos@markitos.com", password_digest: "123")

snax = User.create(username: "snackboi", email: "snackboi@markitos.com", password_digest: "abc")

drama = Genre.create(label: "Drama")

story = Story.create(title: "amazing story", body: "there once a little boi named snackert he sux lmao", location: "Austin Texas", genre_id: drama.id, user_id: markitos.id)

review = Review.create(content: "a heartwarming tale i love it so much!", rating: 5, user_id: snax.id, story_id: story.id)

puts "db seeded!"