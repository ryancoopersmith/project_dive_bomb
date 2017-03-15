require 'rails_helper'

# As a user that loves dive bars
# I should be able to use a search bar to find a certain bar
# So that I can quickly and easily find the bar I'm looking for

# [X] I should see the search bar on the index page
# [X] I should only see the bar that I am searching for

feature "visitor sees search bar on index page" do
  scenario "visitor visits root directory and sees search bar" do
    visit root_path

    expect(page).to have_button('Search')
  end
end
