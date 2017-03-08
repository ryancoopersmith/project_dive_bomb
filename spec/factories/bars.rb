FactoryGirl.define do
  factory :bar do
    sequence(:name) { |n| "bar#{n}" }
    sequence(:url) { |n| "www.#{n}.com" }
    sequence(:address) { |n| "#{n} street" }
    city 'Philadelphia'
    state 'PA'
    zip '19147'
    sequence (:phone_number) { |n| "215-215-215#{n}" }
    image_url 'nautilus_shell.jpg'
    rating 4
  end
end
