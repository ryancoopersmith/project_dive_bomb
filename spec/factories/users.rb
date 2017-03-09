FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "johnBomb#{n}@gmail.com" }
    sequence(:username) { |n| "johnBomb#{n}" }
    password 'password'
    password_confirmation 'password'
  end
end
