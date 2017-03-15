require 'rails_helper'

# As an admin
# I would like to create a new bar
# So that the users can see this new bar

# [X] Only authorized users can create a new bar
# [X] I should see a success message on successful submission
# [X] I should see the new bar on the index page
# [X] I should see an error message if I fill out invalid information

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
    expect(page).to have_content('Image URL')
    expect(page).to have_content('URL')
    expect(page).to have_content('Description')
  end

  scenario "Admin successfully adds new bar" do
    visit new_user_session_path
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Sign In'
    visit new_bar_path

    fill_in "Name", with: "NewBar"
    fill_in "Address", with: "123 free street"
    fill_in "City", with: "Philly"
    select "PA", from: "State"
    fill_in "Zip", with: '12345'
    fill_in "Phone Number", with: '111-222-3333'
    fill_in "Description", with: "Great"
    click_button "Submit"

    expect(page).to have_content("NewBar")
    expect(page).to have_content("Bar Added Successfully")
  end

  scenario "Admin fills out invalid information" do
    visit new_user_session_path
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Sign In'
    visit new_bar_path

    fill_in "Name", with: "NewBar"
    fill_in "Address", with: "123 free street"
    fill_in "City", with: "Philly"
    select "PA", from: "State"
    fill_in "Zip", with: '12345'
    fill_in "Phone Number", with: '111-222-333'
    fill_in "Description", with: "Great"
    click_button "Submit"

    expect(page).to_not have_content("NewBar")
    expect(page).to_not have_content("Bar Added Successfully")
    expect(page).to have_content("Phone number is invalid")
  end

  scenario "user tries to create bar" do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'
    visit new_bar_path

    visit new_bar_path
    expect(page).to have_content("This page doesn't exist")
    expect(page).to_not have_content("Submit")
  end
end
