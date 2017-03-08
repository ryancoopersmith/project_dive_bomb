require 'rails_helper'

feature 'visitor sees reviews for individual bar' do
    let!(:bar1) { FactoryGirl.create(:bar) }
    let!(:admin_review) { FactoryGirl.create(:admin_review) }
    let!(:admin) { admin_review.user }
    let!(:bar2) { admin_review.bar }

    scenario 'A user goes to a showpage and there are no reviews and no headers' do
      visit bar_path(bar1)

      expect(page).to_not have_content("Our Review")
      expect(page).to_not have_content("Your Review")
    end

    scenario 'If there are no user reviews they only see the critic reviews' do

      visit bar_path(bar2)

      expect(page).to have_content("Our Review")
      expect(page).to_not have_content("Your Review")
    end
    #Should not see Your Reviews

    #Should see a breakdown of each category

    #If there are user reviews for a bar a user should be able to see them

    #Expect rating to be an average of all the categories
    #Expect to see the username
    #Expect to see a description if one exists




  #
  #
  #   expect(page).to have_content bar.name
  #   expect(page).to have_content bar.address
  #   expect(page).to have_content bar.city
  #   expect(page).to have_content bar.state
  #   expect(page).to have_content bar.zip
  #   expect(page).to have_link "Website"
  #   expect(page).to have_content bar.phone_number
  #   expect(page).to have_css("img[src*='nautilus_shell.jpg']")
  # end
  #
  # scenario 'clicks on link to bar website' do
  #   bar = FactoryGirl.create(:bar)
  #   visit bar_path(bar)
  #   has_link?('Website', href: 'bar.url')
  # end
end
