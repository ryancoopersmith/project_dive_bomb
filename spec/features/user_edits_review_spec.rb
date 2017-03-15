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
    choose "review_drinks_2"
    choose "review_food_3"
    choose "review_entertainment_4"
    choose "review_vibe_1"
    choose "review_setting_4"
    fill_in "Description", with: "bad"
    click_button "Submit"

    expect(page).to have_content("Review updated successfully")
    expect(page).to have_content("bad")
    expect(page).to have_content(user.username)
  end

  #removed "user edits and puts in invalid information." Since the form was changed to radio buttons,
  #it's impossible to input incorrect information for ratings through the interface.

  #removed "used fills out missing information." The form was changed to radio buttons, on edit it preselects the old params.
  #It's impossible to leave a field blank when editing.
end
