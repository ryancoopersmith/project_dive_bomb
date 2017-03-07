require 'rails_helper'

# As an authenticated user
# I want to view a list of bars
# So that I can pick bars to view

# [] Visiting the `/bars` path should contain a list of bars.
# [] Visiting the root path should display a list of all bars.
feature "visitor sees a list of bars on root directory" do
  scenario "user visits homepage" do
    bar = FactoryGirl.create(:bar)

    visit root_path

    expect(page).to have_content bar.name
    expect(page).to have_content bar.url
    expect(page).to have_content bar.address
    expect(page).to have_content bar.city
    expect(page).to have_content bar.state
    expect(page).to have_content bar.zip
    expect(page).to have_content bar.rating
    expect(page).to have_content bar.phone_number
    expect(page).to have_css("img[src*='nautilus shell.jpg']")
  end
end
