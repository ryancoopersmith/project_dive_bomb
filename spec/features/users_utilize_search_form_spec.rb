require 'rails_helper'

feature "visitor sees search bar on index page" do
  scenario "visitor visits root directory and sees search bar" do
    visit root_path

    expect(page).to have_button('Search')
  end
end

feature "visitor interacts with search bar" do
  let bar1 = FactoryGirl.create(:bar)
  let bar2 = FactoryGirl.create(:bar)

  scenario "visitor does not use search function" do
    visit root_path

    expect(page).to have_content bar1.name
    expect(page).to have_content bar2.name

  end

  scenario "visitor searches for bar1, and doesn't see bar2" do
    visit root_path

    fill_in "term", with: bar1.name
    click_button 'Search'

    expect(page).to have_content(bar1.name)
    expect(page).to_not have_content(bar2.name)
  end
end
