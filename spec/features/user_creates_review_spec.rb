require 'rails_helper'

# As am authenticated user
# I should be able to post a review on a bar
# So that other users can see what I have to say about that bar

# [X] I must be signed in
# [X] I must provide valid information
# [X] I must fill out all form fields
# [X] On successful submission I should be redirected to the bar's show page and see my review
# [X] I should see a success message on successful submission
# [X] I should see an error message on unsuccessful submission

feature 'User creates a review' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:bar) { FactoryGirl.create(:bar) }

  scenario 'user successfully posts a review' do
    visit root_path
    click_link "Sign In"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign In"

    visit bar_path(bar)
    click_link "Create a Review"
    fill_in "Drinks", with: 2
    fill_in "Food", with: 3
    fill_in "Entertainment", with: 4
    fill_in "Vibe", with: 1
    fill_in "Setting", with: 4
    fill_in "Description", with: "fun"
    click_button "Submit"

    expect(page).to have_content("Review added successfully")
    expect(page).to have_content("fun")
    expect(page).to have_content(user.username)
  end

  scenario 'user fills out invalid information' do
    visit root_path
    click_link "Sign In"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign In"

    visit bar_path(bar)
    click_link "Create a Review"
    fill_in "Drinks", with: "great"
    fill_in "Food", with: 3
    fill_in "Entertainment", with: 4
    fill_in "Vibe", with: 1
    fill_in "Setting", with: 4
    fill_in "Description", with: "fun"
    click_button "Submit"

    expect(page).to have_content("Drinks is not a number")
    expect(page).to_not have_content("fun")
    expect(page).to_not have_content("Review added successfully")
  end

  scenario 'user fills out missing information' do
    visit root_path
    click_link "Sign In"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign In"

    visit bar_path(bar)
    click_link "Create a Review"
    fill_in "Drinks", with: 2
    fill_in "Food", with: ''
    fill_in "Entertainment", with: 4
    fill_in "Vibe", with: 1
    fill_in "Setting", with: 4
    fill_in "Description", with: "fun"
    click_button "Submit"

    expect(page).to have_content("Food can't be blank")
    expect(page).to_not have_content("fun")
    expect(page).to_not have_content("Review added successfully")
  end
end
