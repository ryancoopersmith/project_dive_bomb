FactoryGirl.define do
  factory :review do
    user
    bar
    drinks '5'
    food '5'
    entertainment '5'
    vibe '5'
    setting '5'
    description 'What an amazing bar! What an amazing bar! What an amazing bar! What an amazing bar! What an amazing bar!'
  end

  factory :admin_review do
    user :admin
  end
end
