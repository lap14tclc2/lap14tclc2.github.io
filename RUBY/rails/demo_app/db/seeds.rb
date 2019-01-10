# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(
    email: 'admin@gmail.com',
    password: '123456',
    password_confirmation: '123456',
    admin: true)

40.times do |n|
    email = "user#{n+1}@gmail.com"
    password = "123456"
    User.create!(
        email: email, 
        password: password,
        password_confirmation: password,
        admin: false)
  end