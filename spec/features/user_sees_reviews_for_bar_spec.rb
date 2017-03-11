require 'rails_helper'
# User sees reviews on bar show page
# If there are no user reviews, user only sees critic review
# Should not see User Reviewss
# Should see a breakdown of each category
# If there are user reviews for a bar a user should be able to see them
# Expect rating to be an average of all the categories
# Expect to see the username
# Expect to see a description if one exists

feature 'visitor sees reviews for individual bar' do
  let!(:bar1) { FactoryGirl.create(:bar) }
  let!(:admin) { FactoryGirl.create(:user, admin: true) }
  let!(:admin_review) { FactoryGirl.create(:review, user: admin) }
  let!(:bar2) { admin_review.bar }
  let!(:review) { FactoryGirl.create(:review) }
  let!(:bar3) { review.bar }

  scenario 'A user goes to a showpage and there are no reviews or headers' do
    visit bar_path(bar1)

    expect(page).to_not have_content("Our Review")
    expect(page).to_not have_content("User Reviews")
  end

  scenario 'If there are no user reviews they only see the critic reviews' do
    visit bar_path(bar2)

    expect(page).to have_content("Our Review")
    expect(page).to_not have_content("User Reviews")
    expect(page).to have_content(admin_review.drinks)
    expect(page).to have_content(admin_review.food)
    expect(page).to have_content(admin_review.entertainment)
    expect(page).to have_content(admin_review.setting)
    expect(page).to have_content(admin_review.vibe)
    expect(page).to_not have_content(review.user.username)
  end

  scenario 'If there are user reviews, the user can see them' do
    visit bar_path(bar3)

    expect(page).to have_content("User Review")
    expect(page).to have_content(review.user.username)
    expect(page).to have_content((review.drinks + review.food +
      review.entertainment + review.setting + review.vibe) / 5)
    expect(page).to_not have_content(admin_review.user.username)
  end
end
