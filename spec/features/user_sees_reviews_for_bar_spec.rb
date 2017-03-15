require 'rails_helper'

# As a user that loves dive bars
# I want to see reviews for a particular bar
# So that I can get more information about this bar

# [X] I don't have to be signed in
# [X] I should see the critic's reviews and other user's reviews

feature 'visitor sees reviews for individual bar' do
  let!(:bar1) { FactoryGirl.create(:bar) }
  let!(:admin) { FactoryGirl.create(:user, admin: true) }
  let!(:admin_review) { FactoryGirl.create(:review, user: admin) }
  let!(:bar2) { admin_review.bar }
  let!(:review) { FactoryGirl.create(:review) }
  let!(:bar3) { review.bar }

  scenario 'A user goes to a showpage and there are no reviews or headers' do
    visit bar_path(bar1)

    expect(page).to_not have_content("Our Breakdown")
    expect(page).to_not have_content("User Reviews")
  end

  scenario 'If there are no user reviews they only see the critic reviews' do
    visit bar_path(bar2)

    expect(page).to have_content("Our Breakdown")
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

    expect(page).to have_content("User Reviews")
    expect(page).to have_content(review.user.username)
    expect(page).to have_content((review.drinks + review.food +
      review.entertainment + review.setting + review.vibe) / 5)
    expect(page).to_not have_content(admin_review.user.username)
  end
end
