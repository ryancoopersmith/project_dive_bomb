require 'rails_helper'

# [] Only authorized users can create a new bar

feature 'create a bar link is only available to admin' do
  let(:user) {FactoryGirl.create(:user)}
  let(:admin) { FactoryGirl.create(:user, admin: true) }
  scenario 'Unauthorized user visits homepage and does not see button to create a new bar' do
    visit root_path

    expect(page).to_not have_link "Create Bar"
  end

  scenario "Authorized user visits homepage and does not see button to create bar" do
    user
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    expect(page).to_not have_link "Create Bar"
  end

  scenario "Admin visits homepage and sees button to create bar" do
    admin
    visit new_user_session_path
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Sign In'

    expect(page).to have_link "Create Bar"
  end
end

feature 'create a bar link is only available to admin' do
  let(:user) {FactoryGirl.create(:user)}
  let(:admin) { FactoryGirl.create(:user, admin: true) }

  scenario "Unauthorized user is unable to use direct path to new bar form" do
    visit new_bar_path

    expect(page).to have_content("This page doesn't exist")
    #not passing, rake is bringing up an older format and won't reset to the new
  end

  scenario "Authorized user is unable to use direct path to new bar form" do
    user
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'
    visit new_bar_path

    expect(page).to have_content("This page doesn't exist")
  end

  scenario "Admin is able to use direct path to new bar form" do
    admin
    visit new_user_session_path
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Sign In'
    visit new_bar_path

    expect(page).to have_content('Name')
    expect(page).to have_content('Address')
    expect(page).to have_content('City')
    expect(page).to have_content('State')
    expect(page).to have_content('Zip')
    expect(page).to have_content('Phone Number')
    expect(page).to have_content('Image Url')
    expect(page).to have_content('Url')
    expect(page).to have_content('Description')
  end
end


#Admin creates new bar

#admin creates bars with errors (test flash notices)
