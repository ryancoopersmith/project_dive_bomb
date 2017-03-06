require 'rails_helper'
require 'database_cleaner'
DatabaseCleaner.strategy = :truncation

feature 'user signs in' do
  # As a user that wants to buy and sell products
  # I should be able to sign in using my account information
  # So that I can buy and sell products associated with me

  # * I must provide a valid email
  # * I must provide a valid password
  # * I should see an error message if I enter an invalid email or invalid
  #   password
  DatabaseCleaner.start
  DatabaseCleaner.clean
  user = FactoryGirl.create(:user)

  scenario 'user visits sign in page' do
    visit root_path
    click_link 'Sign In'
    expect(page).to have_content('Sign In')
    expect(page).to have_content('Email')
    expect(page).to have_content('Password')
  end

  scenario 'user successfully signs in' do
    visit new_user_registration_path
    fill_in 'Username', with: user.username
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password Confirmation', with: user.password_confirmation
    click_button 'Sign Up'

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    expect(page).to have_content("You've succssfully signed in!")
    expect(page).to_not have_content('Sign In')
    expect(page).to_not have_content('Sign Up')

    DatabaseCleaner.clean
  end

  scenario 'user provides incorrect password' do
    visit new_user_registration_path
    fill_in 'Username', with: user.username
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password Confirmation', with: user.password_confirmation
    click_button 'Sign Up'

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'notmypassword'
    click_button 'Sign In'

    expect(page).to have_content("Incorrect password.")
    expect(page).to have_content('Sign In')
    expect(page).to_not have_content("You've succssfully signed In!")

    DatabaseCleaner.clean
  end

  scenario 'user provides incorrect email' do
    visit new_user_registration_path
    fill_in 'Username', with: user.username
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password Confirmation', with: user.password_confirmation
    click_button 'Sign Up'

    visit new_user_session_path
    fill_in 'Email', with: 'wrongemail@email.com'
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    expect(page).to_not have_content("You've successfully signed in!")
    expect(page).to have_content('Email is invalid')
    expect(page).to have_content('Sign In')

    DatabaseCleaner.clean
  end

  scenario 'user provides missing information' do
    visit new_user_registration_path
    fill_in 'Username', with: user.username
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password Confirmation', with: user.password_confirmation
    click_button 'Sign Up'

    visit new_user_session_path
    fill_in 'Email', with: user.email
    click_button 'Sign In'

    expect(page).to_not have_content("You've succssfully signed In!")
    expect(page).to have_content("Password can't be blank")
    expect(page).to have_content('Sign In')

    DatabaseCleaner.clean
  end
end
