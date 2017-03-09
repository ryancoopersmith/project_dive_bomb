# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Bar.destroy_all
Bar.create!(name: "Oscar's Tavern", address: '1524 Sansom St.', city: 'Philadelphia', state: 'PA', zip: '19130', phone_number: '215-972-9938', url: "https://m.facebook.com/Oscars-Tavern-187176721252/", image_url: "https://scontent-mia1-2.xx.fbcdn.net/v/t1.0-9/fr/cp0/e15/q65/1917917_213451346252_6865044_n.jpg?efg=eyJpIjoidCJ9&oh=9d75e498e46764c1d3f398d8a69c6d1f&oe=596BD775", rating: 4.5, description: "One of the most storied dives in Center City. Patrons always feel welcome and the drink menu does not disappoint. Neither does the cheeseteak and a half for $7.")
Bar.create!(name: "Dirty Frank's Bar", address: '347 S. 13th St.', city: 'Philadelphia', state: 'PA', zip: '19107', phone_number: '215-732-5010', url: "www.dirtyfranksbar.com", image_url: "http://jayfmillercreative.com/wp-content/uploads/2012/01/i_Dirty-Franks-JFMillerCr.jpg", rating: 4)

if Rails.env.development? || Rails.env.production?
  User.destroy_all
  devin = User.create!(username: "dbombay", email: "devin.bombay@gmail.com",
   password: "dbombay1", password_confirmation: "dbombay1")
  ryan = User.create!(username: "ryancoopersmith1", email: "ryancoopersmith1@gmail.com",
   password: "password", password_confirmation: "password")
  arielle = User.create!(username: "arilandau", email: "ariellelandau360@gmail.com",
   password: "password1", password_confirmation: "password1")
  corey = User.create!(username: "fischer0525", email: "fischer0525@gmail.com",
   password: "password2", password_confirmation: "password2")
end
