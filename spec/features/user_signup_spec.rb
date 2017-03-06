require 'rails_helper'
require 'database_cleaner'
DatabaseCleaner.strategy = :truncation

feature 'user signs up' do
  # As a user that wants to buy and sell products
  # I should be able to sign up if I do not have an account
  # So that I can buy and sell products associated with me

  # * I must provide a first and last name
  # * I must provide a valid email
  # * I must provide a password that matches the password confirmation
  # * I should be sent to the index page on submition and see a success message
  # * I should see an error message if I enter an invalid email or my password
  #   and password confirmations do not match
  DatabaseCleaner.start
  DatabaseCleaner.clean
  user = FactoryGirl.create(:user)

  scenario 'user visits sign up page' do
    visit root_path
    click_link 'Sign Up'
    expect(page).to have_content('Sign Up')
    expect(page).to have_content('Username')
    expect(page).to have_content('Email')
    expect(page).to have_content('Password')
    expect(page).to have_content('Password Confirmation')
  end

  scenario 'user successfully signs up' do
    visit new_user_registration_path
    fill_in 'Username', with: user.username
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password Confirmation', with: user.password_confirmation
    click_button 'Sign Up'

    expect(page).to have_content("You've succssfully signed up!")
    expect(page).to_not have_content('Sign Up')
    expect(page).to_not have_content('Sign In')
    DatabaseCleaner.clean
  end

  scenario 'user provides different password confirmation' do
    visit new_user_registration_path
    fill_in 'Username', with: user.username
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password Confirmation', with: 'notmypassword'
    click_button 'Sign Up'

    expect(page).to have_content("Password confirmation doesn't match password")
    expect(page).to have_content('Sign Up')
    expect(page).to_not have_content("You've succssfully signed up!")
    DatabaseCleaner.clean
  end

  scenario 'user provides invalid email' do
    visit new_user_registration_path
    fill_in 'Username', with: user.username
    fill_in 'Email', with: 'wrongemail@.com'
    fill_in 'Password', with: user.password
    fill_in 'Password Confirmation', with: user.password_confirmation
    click_button 'Sign Up'

    expect(page).to_not have_content("You've successfully signed up!")
    expect(page).to have_content('Email is invalid')
    expect(page).to have_content('Sign Up')
    DatabaseCleaner.clean
  end

  scenario 'user provides missing information' do
    visit new_user_registration_path
    fill_in 'Username', with: " "
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password Confirmation', with: user.password_confirmation
    click_button 'Sign Up'

    expect(page).to_not have_content("You've succssfully signed up!")
    expect(page).to have_content("Username can't be blank")
    expect(page).to have_content('Sign Up')
    DatabaseCleaner.clean
  end
end
