require 'rails_helper'

feature "profile photo" do
  # As a user that wants to find the best local dive bars
  # I should be able to upload a profile photo when I sign up
  # So that when I post reviews, other users can optionally see my photo

  # [X] I must provide a first and last name
  # [X] I must provide a valid email
  # [X] I must provide a password that matches the password confirmation
  # [X] I should be sent to the index page on submition and see a success message
  # [X] I should see an error message if I enter an invalid email or my password and password confirmations do not match

  scenario "user uploads a profile photo" do
    visit root_path
    click_link "Sign Up"
    fill_in "Username", with: "jennyb"
    fill_in "Email", with: "jennyb2@gmail.com"
    fill_in "Password", with: "password"
    fill_in "Password Confirmation", with: "password"
    attach_file "Profile Photo", File.join(Rails.root, 'spec', 'support', 'images', 'golden_retriever_dog_animal.jpg')
    click_button "Sign Up"
    click_link "My Account"

    expect(page).to have_css("img[src*='golden_retriever_dog_animal.jpg']")
  end
end
