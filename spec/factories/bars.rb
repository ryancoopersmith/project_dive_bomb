FactoryGirl.define do
  factory :bar do
    sequence(:name) { |n| "bar#{n}" }
    sequence(:url) { |n| "www.#{n}.com" }
    sequence(:address) { |n| "#{n} street" }
    city 'Philadelphia'
    state 'PA'
    zip '19147'
    phone_number '215-215-2152'
    image_url 'nautilus_shell.jpg'
    rating rand(1..5)
  end
end
