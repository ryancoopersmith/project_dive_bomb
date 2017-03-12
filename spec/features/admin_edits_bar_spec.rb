require 'rails_helper'

# As an admin
# I would like to edit any bars
# So that I can provide the most up-to-date information

# [] I should have to fill in all the information on the form
# [] If I provide any missing or invalid information I should see an error message
# [] If I successfully post the form I should see a success message
# [] I should be taken to that bar's show page on submission
# [] Only admins should be able to edit a bar

feature 'Admin edits bar' do
  let!(:admin) { FactoryGirl.create(:user, admin: true) }
  let!(:user) { FactoryGirl.create(:user) }
  let!(:bar) { FactoryGirl.create(:bar) }

  scenario 'admin fills out all valid information' do
    visit root_path
    click_link "Sign In"
    fill_in "Email", with: admin.email
    fill_in "Password", with: admin.password
    click_button "Sign In"

    visit bar_path(bar)
    click_link "Edit Bar"
    fill_in "Name", with: "New Bar Name"
    click_button "Submit"

    expect(page).to have_content("New Bar Name")
    expect(page).to have_content("Bar Edited Successfully")
  end

  scenario 'admin fills out invalid information' do
    visit root_path
    click_link "Sign In"
    fill_in "Email", with: admin.email
    fill_in "Password", with: admin.password
    click_button "Sign In"

    visit bar_path(bar)
    click_link "Edit Bar"
    fill_in "Phone Number", with: "111-222"
    click_button "Submit"

    expect(page).to have_content("Phone number is invalid")
    expect(page).to_not have_content("Bar Edited Successfully")
  end

  scenario 'admin fills out missing information' do
    visit root_path
    click_link "Sign In"
    fill_in "Email", with: admin.email
    fill_in "Password", with: admin.password
    click_button "Sign In"

    visit bar_path(bar)
    click_link "Edit Bar"
    fill_in "Phone Number", with: ""
    click_button "Submit"

    expect(page).to have_content("Phone number can't be blank")
    expect(page).to_not have_content("Bar Edited Successfully")
  end

  scenario 'user tries to visit bar edit page' do
    visit root_path
    click_link "Sign In"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign In"

    visit edit_bar_path(bar)

    expect(page).to have_content("This page doesn't exist")
  end
end
