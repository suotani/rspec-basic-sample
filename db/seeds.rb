# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = User.create(email: "sample1@example.com", password: "password", password_confirmation: "password")
user2 = User.create(email: "sample2@example.com", password: "password", password_confirmation: "password")

Todo.create(user_id: user1.id, text: "買い物", priority: 1)
Todo.create(user_id: user1.id, text: "旅行", priority: 4)
Todo.create(user_id: user2.id, text: "仕事", priority: 5)
Todo.create(user_id: user2.id, text: "買い物", priority: 3)