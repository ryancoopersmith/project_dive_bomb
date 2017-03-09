FactoryGirl.define do
  factory :bar do
    name 'Rays Happy Birthday Bar'
    url 'www.rayshappybirthdaybar.com'
    sequence(:address) { |n| "#{n}123 Passyunk Ave" }
    city 'Philadelphia'
    state 'PA'
    zip '19147'
    sequence(:phone_number, (0..9).cycle) { |n| "#{n}15-215-2155" }
    image_url 'nautilus_shell.jpg'
    rating '4'
  end
end
