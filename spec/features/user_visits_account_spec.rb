require 'rails_helper'

# As an authenticated user
# I would like to see my account information
# So that I can change any information I don't like

# [X] I must be signed in
# [X] I should see my profile pic
# [X] I should be able to change my profile pic
# [X] I should be able to delete my account
# [X] I should be able to change my password
# [X] I should be able to edit my account
# [X] I should see a success message upon successful submission
# [X] I should see an error message if I provide invalid information

feature 'user visits account page' do
  let!(:user) { FactoryGirl.create(:user) }

  scenario "user clicks on 'My Account'" do
    visit root_path
    click_link "Sign In"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign In"
    click_link "My Account"

    expect(page).to have_content("Edit")
    expect(page).to have_content("Unhappy?")
  end

  scenario "user successfully edits account information" do
    visit root_path
    click_link "Sign In"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign In"

    click_link "My Account"
    fill_in "Username", with: "newusername"
    fill_in "Password", with: 'newpassword'
    fill_in "Password Confirmation", with: "newpassword"
    fill_in "Current Password", with: user.password
    click_button "Update"

    expect(page).to have_content('Your account has been updated successfully.')
  end

  scenario "user edits account with invalid information" do
    visit root_path
    click_link "Sign In"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign In"

    click_link "My Account"
    fill_in "Email", with: "newemail@com"
    click_button "Update"

    expect(page).to_not have_content('Your account has been updated successfully.')
    expect(page).to have_content('Email is invalid')
  end

  scenario "user deletes account" do
    visit root_path
    click_link "Sign In"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign In"

    click_link "My Account"
    click_button "Delete Account"

    expect(page).to_not have_content('Bye! We hope to see you again soon')
    expect(page).to_not have_content('Sign Out')
  end
end
