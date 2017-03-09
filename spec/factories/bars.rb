FactoryGirl.define do
  factory :bar do
    sequence(:name) { |n| "bar#{n}" }
    sequence(:url) { |n| "www.#{n}.com" }
    sequence(:address) { |n| "#{n} street" }
    city 'Philadelphia'
    state 'PA'
    zip '19147'
    sequence(:phone_number, (0..9).cycle) { |n| "#{n}15-215-2155" }
    image_url 'nautilus_shell.jpg'
  end
end
