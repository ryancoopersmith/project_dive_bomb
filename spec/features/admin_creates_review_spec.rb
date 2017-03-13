require 'rails_helper'

# As an admin
# I would like to post a review
# So that users can know how we rate the bar

# [] My review should appear in the bar's show page on successful submission

feature 'admin creates review' do
  let!(:admin) { FactoryGirl.create(:user, admin: true) }
  let!(:bar) { FactoryGirl.create(:bar) }
  scenario 'admin creates new review' do
    visit root_path
    click_link "Sign In"
    fill_in "Email", with: admin.email
    fill_in "Password", with: admin.password
    click_button "Sign In"

    visit bar_path(bar)
    click_link "Create a Review"
    fill_in "Drinks", with: 5
    fill_in "Food", with: 5
    fill_in "Entertainment", with: 5
    fill_in "Vibe", with: 5
    fill_in "Setting", with: 5
    fill_in "Description", with: "fun"
    click_button "Submit"

    expect(page).to have_content("Our Rating: 5.0 / 5")
  end
end
