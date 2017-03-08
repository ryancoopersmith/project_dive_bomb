if Rails.env.development? || Rails.env.production?
  Bar.destroy_all
  bar = Bar.create!(name: "Oscar's Tavern", address: '1524 Sansom St.', city: 'Philadelphia', state: 'PA', zip: '19130', phone_number: '215-972-9938', url: "https://m.facebook.com/Oscars-Tavern-187176721252/", image_url: "https://scontent-mia1-2.xx.fbcdn.net/v/t1.0-9/fr/cp0/e15/q65/1917917_213451346252_6865044_n.jpg?efg=eyJpIjoidCJ9&oh=9d75e498e46764c1d3f398d8a69c6d1f&oe=596BD775", rating: 4.5, description: "One of the most storied dives in Center City. Patrons always feel welcome and the drink menu does not disappoint. Neither does the cheeseteak and a half for $7.")
  Bar.create!(name: "Dirty Frank's Bar", address: '347 S. 13th St.', city: 'Philadelphia', state: 'PA', zip: '19107', phone_number: '215-732-5010', url: "www.dirtyfranksbar.com", image_url: "http://jayfmillercreative.com/wp-content/uploads/2012/01/i_Dirty-Franks-JFMillerCr.jpg", rating: 4)

  User.destroy_all
  devin = User.create!(username: "dbombay", email: "devin.bombay@gmail.com",
   password: "dbombay1", password_confirmation: "dbombay1", admin: true)
  ryan = User.create!(username: "ryancoopersmith1", email: "ryancoopersmith1@gmail.com",
   password: "password", password_confirmation: "password")
  arielle = User.create!(username: "arilandau", email: "ariellelandau360@gmail.com",
   password: "password1", password_confirmation: "password1")
  corey = User.create!(username: "fischer0525", email: "fischer0525@gmail.com",
   password: "admidddn", password_confirmation: "admidddn")
  stranger = User.create!(username: "fischeeer0525", email: "fischeeeeer0525@gmail.com",
   password: "admmmmmmmmin", password_confirmation: "admmmmmmmmin")
  stranger2 = User.create!(username: "fischeeeeeer0525", email: "fischeeeeeeeer0525@gmail.com",
   password: "admmmmmmmmin", password_confirmation: "admmmmmmmmin")

  Review.destroy_all
  Review.create(user: devin, bar: bar, drinks: 5, food: 5, setting: 5, vibe: 5, entertainment: 5, description: "we love this bar!")
  Review.create(user: stranger, bar: bar, drinks: 1, food: 1, setting: 1, vibe: 1, entertainment: 1, description: "we hate this bar!")
  Review.create(user: stranger2, bar: bar, drinks: 3, food: 3, setting: 3, vibe: 3, entertainment: 3, description: "meh!")

end
