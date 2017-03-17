require 'rails_helper'

# As a user that loves dive bars
# I should be able to see all the information about that dive bar
# So that I can know more about it

# [X] I don't have to be signed in
# [X] I should see details for the individual bar
# [X] I should be able to go to the bar's website if I click on the link

feature 'visitor sees details for individual bar' do
  scenario 'sees full information for specific bar' do
    bar = FactoryGirl.create(:bar)
    visit bar_path(bar)

    expect(page).to have_content bar.name
    expect(page).to have_content bar.address.upcase
    expect(page).to have_content bar.city.upcase
    expect(page).to have_content bar.state
    expect(page).to have_content bar.zip
    expect(page).to have_content bar.phone_number
    expect(page).to have_css("img[src*='nautilus_shell.jpg']")
  end

  scenario 'clicks on link to bar website' do
    bar = FactoryGirl.create(:bar)
    visit bar_path(bar)
    has_link?('Website', href: 'bar.url')
  end
end
