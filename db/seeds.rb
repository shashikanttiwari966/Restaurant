# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

unless AdminUser.find_by(:email => 'admin@example.com')
  AdminUser.create!(:email => 'admin@example.com', :password => 'password', :password_confirmation => 'password')
end

Category.find_or_create_by(name: "Pizza")
Category.find_or_create_by(name: "Burger")
Category.find_or_create_by(name: "Cake")
Category.find_or_create_by(name: "Sandwich")
Category.find_or_create_by(name: "Thali")
Category.find_or_create_by(name: "Biryani")