require 'rails_helper'

# As an admin
# I would like to delete user's reviews
# So that I can filter any inappropriate content

# [X] I should be able to delete any review
# [X] I should see a success message upon successful deletion

feature "Admin deletes review" do
  let!(:admin) { FactoryGirl.create(:user, admin: true) }
  let!(:user) { FactoryGirl.create(:user) }
  let!(:bar) { FactoryGirl.create(:bar) }
  let!(:review) { FactoryGirl.create(:review, user: user, bar: bar) }

  scenario "admin clicks delete link" do
    visit root_path
    click_link "Sign In"
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button "Sign In"
    visit bar_path(bar)
    click_link "Delete Review"
    expect(page).to have_content("Review deleted successfully")
    expect(page).to_not have_content(review.description)
  end
end
