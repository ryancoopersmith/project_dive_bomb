# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Rails.env.development? || Rails.env.production?
  devin = User.create!(username: "dbombay", email: "devin.bombay@gmail.com",
   password: "dbombay1", password_confirmation: "dbombay1")
  ryan = User.create!(username: "ryancoopersmith1", email: "ryancoopersmith1@gmail.com",
   password: "password", password_confirmation: "password")
  arielle = User.create!(username: "arilandau", email: "ariellelandau360@gmail.com",
   password: "password1", password_confirmation: "password1")
  corey = User.create!(username: "fischer0525", email: "fischer0525@gmail.com",
   password: "admin", password_confirmation: "admin")
end
