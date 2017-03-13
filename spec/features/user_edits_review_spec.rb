require 'rails_helper'

# As am authenticated user
# I should be able to edit my review on a bar
# So that I can provide up-to-date information

# [X] I must be signed in
# [X] I must provide valid information
# [X] I must fill out all form fields
# [X] On successful submission I should be redirected to the bar's show page and see my review
# [X] I should see a success message on successful submission
# [X] I should see an error message on unsuccessful submission

feature 'User creates a review' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:bar) { FactoryGirl.create(:bar) }
  let!(:review) { FactoryGirl.create(:review, user: user, bar: bar) }

  scenario 'user successfully posts a review' do
    visit root_path
    click_link "Sign In"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign In"

    visit bar_path(bar)
    click_link "Edit Review"
    fill_in "Drinks", with: 2
    fill_in "Food", with: 3
    fill_in "Entertainment", with: 4
    fill_in "Vibe", with: 1
    fill_in "Setting", with: 4
    fill_in "Description", with: "bad"
    click_button "Submit"

    expect(page).to have_content("Review updated successfully")
    expect(page).to have_content("bad")
    expect(page).to have_content(user.username)
  end

  scenario 'user fills out invalid information' do
    visit root_path
    click_link "Sign In"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign In"

    visit bar_path(bar)
    click_link "Edit Review"
    fill_in "Drinks", with: "horrible"
    fill_in "Food", with: 3
    fill_in "Entertainment", with: 4
    fill_in "Vibe", with: 1
    fill_in "Setting", with: 4
    fill_in "Description", with: "bad"
    click_button "Submit"

    expect(page).to have_content("Drinks is not a number")
    expect(page).to_not have_content("bad")
    expect(page).to_not have_content("Review updated successfully")
  end

  scenario 'user fills out missing information' do
    visit root_path
    click_link "Sign In"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign In"

    visit bar_path(bar)
    click_link "Edit Review"
    fill_in "Drinks", with: 2
    fill_in "Food", with: ''
    fill_in "Entertainment", with: 4
    fill_in "Vibe", with: 1
    fill_in "Setting", with: 4
    fill_in "Description", with: "bad"
    click_button "Submit"

    expect(page).to have_content("Food can't be blank")
    expect(page).to_not have_content("bad")
    expect(page).to_not have_content("Review updated successfully")
  end
end
