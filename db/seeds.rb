# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


10.times do |n|
  name  = "Buyer " +Faker::Name.name
  email = "example-#{n+1}@buyer.org"
  puts email
  password = "123456"
  type = "buy"
  User.create!(name:  name,
               email: email,
               user_type: type,
               password:              password,
               password_confirmation: password)
end

(12..20).each do |n|
  name  = "Seller " +Faker::Name.name
  email = "example-#{n+1}seller.org"
  puts email
  password = "123456"
  type = "buy"
  User.create!(name:  name,
               email: email,
               user_type: type,
               password:              password,
               password_confirmation: password)
  
end