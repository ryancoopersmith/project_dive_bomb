require 'rails_helper'

describe Review do
  scenario 'user creates a review successfully' do
    review = FactoryGirl.create(:review)
    bar = FactoryGirl.create(:bar)

    visit bar_path(bar)

    expect(page).to have_content review.username
    expect(page).to have_content review.drinks
    expect(page).to have_content review.food
    expect(page).to have_content review.entertainment
    expect(page).to have_content review.decor
    expect(page).to have_content review.vibe
    expect(page).to have_content review.description
  end

  scenario 'user forgets to add a username' do

    expect(page).to have_content 'Username must be present'
  end

  scenario 'user puts in the wrong number for a rating category' do

    expect(page).to have_content 'Decor must be between 0 and 1'
  end

  scenario 'user puts in a description less than 150 characters' do

    expect(page).to have_content 'Description must be at least 150 characters'
  end
end
