require 'rails_helper'

feature 'visitor sees details for individual bar' do
  scenario 'sees full information for specific bar' do
    bar = FactoryGirl.create(:bar)
    visit bar_path(bar)

    expect(page).to have_content bar.name
    expect(page).to have_content bar.address
    expect(page).to have_content bar.city
    expect(page).to have_content bar.state
    expect(page).to have_content bar.zip
    expect(page).to have_link "Website"
    expect(page).to have_content bar.phone_number
    expect(page).to have_css("img[src*='nautilus_shell.jpg']")
  end

  scenario 'clicks on link to bar website' do
    bar = FactoryGirl.create(:bar)
    visit bar_path(bar)
    has_link?('Website', href: 'bar.url')
  end
end
