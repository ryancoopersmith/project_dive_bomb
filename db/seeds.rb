if Rails.env.development? || Rails.env.production?
  Bar.destroy_all
  bar = Bar.create!(name: "Oscar's Tavern", address: '1524 Sansom St.', city: 'Philadelphia', state: 'PA', zip: '19130', phone_number: '215-972-9938', url: "https://m.facebook.com/Oscars-Tavern-187176721252/", image_url: "https://scontent-mia1-2.xx.fbcdn.net/v/t1.0-9/fr/cp0/e15/q65/1917917_213451346252_6865044_n.jpg?efg=eyJpIjoidCJ9&oh=9d75e498e46764c1d3f398d8a69c6d1f&oe=596BD775", description: "One of the most storied dives in Center City. Patrons always feel welcome and the drink menu does not disappoint. Neither does the cheeseteak and a half for $7.")
  bar1 = Bar.create!(name: "Dirty Frank's Bar", address: '347 S. 13th St.', city: 'Philadelphia', state: 'PA', zip: '19107', phone_number: '215-732-5010', url: "www.dirtyfranksbar.com", image_url: "http://jayfmillercreative.com/wp-content/uploads/2012/01/i_Dirty-Franks-JFMillerCr.jpg")

  User.destroy_all
  devin = User.create!(username: "dbombay", email: "devin.bombay@gmail.com",
   password: "dbombay1", password_confirmation: "dbombay1", admin: true)
  ryan = User.create!(username: "ryancoopersmith1", email: "ryancoopersmith1@gmail.com",
   password: "password", password_confirmation: "password", admin: true)
  arielle = User.create!(username: "arilandau", email: "ariellelandau360@gmail.com",
   password: "password1", password_confirmation: "password1", admin: true)
  corey = User.create!(username: "fischer0525", email: "fischer0525@gmail.com",
   password: "administration", password_confirmation: "administration", admin: true)
  stranger = User.create!(username: "stranger", email: "stranger0525@gmail.com",
   password: "not_administration", password_confirmation: "not_administration")

   Review.destroy_all
   Review.create(user: devin, bar: bar, food: 10, drinks: 10, entertainment: 10, decor: 10, vibe: 10, description: "I love this bar, I love this bar, I love this bar, I love this bar, I love this bar, I love this bar I love this bar, I love this bar, I love this bar, I love this bar, I love this bar, I love this bar")
   Review.create(user: stranger, bar: bar, food: 1, drinks: 1, entertainment: 1, decor: 1, vibe: 1, description: "I hate this bar, I hate this bar, I this bar, I hate this bar, I hate this bar, I this bar, I hate this bar ")
end
