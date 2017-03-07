require 'rails_helper'

feature 'user signs in' do
  # As a user that wants to find the best local dive bars
  # I should be able to sign in using my account information
  # So that I can post reviews about local dive bars

  # * I must provide a valid email
  # * I must provide a valid password
  # * I should see an error message if I enter an invalid email or invalid
  #   password

  before(:each) do
    @user = FactoryGirl.create(:user)
    visit new_user_registration_path
    fill_in 'Username', with: @user.username
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    fill_in 'Password Confirmation', with: @user.password_confirmation
    click_button 'Sign Up'
    expect(page).to have_content("zzzzzzzzzzz")
    click_link 'Sign Out'
    visit new_user_session_path
  end

  scenario 'user visits sign in page' do
    click_link 'Sign In'
    expect(page).to have_content('Sign In')
    expect(page).to have_content('Email')
    expect(page).to have_content('Password')
  end

  scenario 'user successfully signs in' do
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Sign In'

    expect(page).to have_content("You've succssfully signed in!")
    expect(page).to_not have_content('Sign In')
    expect(page).to_not have_content('Sign Up')
  end

  scenario 'user provides incorrect password' do
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: 'notmypassword'
    click_button 'Sign In'

    expect(page).to have_content("Incorrect password.")
    expect(page).to have_content('Sign In')
    expect(page).to_not have_content("You've succssfully signed In!")
  end

  scenario 'user provides incorrect email' do
    fill_in 'Email', with: 'wrongemail@email.com'
    fill_in 'Password', with: @user.password
    click_button 'Sign In'

    expect(page).to_not have_content("You've successfully signed in!")
    expect(page).to have_content('Email is invalid')
    expect(page).to have_content('Sign In')
  end

  scenario 'user provides missing information' do
    fill_in 'Email', with: @user.email
    click_button 'Sign In'

    expect(page).to_not have_content("You've succssfully signed In!")
    expect(page).to have_content("Password can't be blank")
    expect(page).to have_content('Sign In')
  end
end
