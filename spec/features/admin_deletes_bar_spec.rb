require 'rails_helper'

# As an admin
# I would like to be able to delete a bar
# If it no longer exists

# [X] I must be an admin to delete the bar
# [X] I should be redirected to the root page upon deletion

feature 'Admin deletes bar' do
  let!(:admin) { FactoryGirl.create(:user, admin: true) }
  let!(:bar) { FactoryGirl.create(:bar) }

  scenario 'admin clicks the delete link' do
    visit root_path
    click_link "Sign In"
    fill_in "Email", with: admin.email
    fill_in "Password", with: admin.password
    click_button "Sign In"

    visit bar_path(bar)
    click_link("Delete Bar")
    expect(page).to have_content("Bar Deleted Successfully")
    expect(page).to_not have_content("Website")
  end
end
