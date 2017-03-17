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
# [X] I should only be able to post one review per bar

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
    click_link "Create Review"
    choose "review_drinks_2"
    choose "review_food_3"
    choose "review_entertainment_4"
    choose "review_vibe_1"
    choose "review_setting_4"
    fill_in "Description", with: "fun"
    click_button "Submit"

    expect(page).to have_content("Review added successfully")
    expect(page).to have_content("fun")
    expect(page).to have_content(user.username)
  end

  scenario 'user posts two reviews' do
    visit root_path
    click_link "Sign In"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign In"

    visit bar_path(bar)
    click_link "Create Review"
    choose "review_drinks_2"
    choose "review_food_3"
    choose "review_entertainment_4"
    choose "review_vibe_1"
    choose "review_setting_4"
    fill_in "Description", with: "fun"
    click_button "Submit"

    visit new_bar_review_path(bar)

    expect(page).to_not have_content("Submit")
    expect(page).to have_content("You cannot submit more than one review")
  end

  scenario 'user fills out invalid information' do
    visit root_path
    click_link "Sign In"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign In"

    visit bar_path(bar)
    click_link "Create Review"
    choose "review_food_3"
    choose "review_entertainment_4"
    choose "review_vibe_1"
    choose "review_setting_4"
    fill_in "Description", with: "fun"
    click_button "Submit"

    expect(page).to have_content("Drinks can't be blank")
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
    click_link "Create Review"
    choose "review_drinks_2"
    choose "review_entertainment_4"
    choose "review_vibe_1"
    choose "review_setting_4"
    fill_in "Description", with: "fun"
    click_button "Submit"

    expect(page).to have_content("Food can't be blank")
    expect(page).to_not have_content("fun")
    expect(page).to_not have_content("Review added successfully")
  end
end
