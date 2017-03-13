require 'rails_helper'

# As an authenticated user
# I want to delete my review
# So no one can see it anymore

# [X] I should see a success message on successful deletion

feature 'User deletes review' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:bar) { FactoryGirl.create(:bar) }
  let!(:review) { FactoryGirl.create(:review, user: user, bar: bar) }

  scenario 'user clicks delete link' do
    visit root_path
    click_link "Sign In"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign In"

    visit bar_path(bar)
    click_link "Delete Review"
    expect(page).to have_content("Review deleted successfully" )
    expect(page).to_not have_content("What an amazing bar!")
  end
end
