FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "johnBomb#{n}@gmail.com" }
    username 'johnBombbb'
    password 'password'
    password_confirmation 'password'
  end

  factory :admin do
    admin true
  end
end
