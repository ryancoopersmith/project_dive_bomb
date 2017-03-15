require 'rails_helper'

# As an authenticated user
# I want to view a list of bars
# So that I can pick a bar to view

# [X] Visiting the `/bars` path should contain a list of bars.
# [X] Visiting the root path should display a list of all bars.

# feature "visitor sees a list of bars on root directory" do
#   scenario "user visits homepage" do
#     bar = FactoryGirl.create(:bar)
#
#     visit root_path
#
#     expect(page).to have_content bar.name
#     expect(page).to have_content bar.address
#     expect(page).to have_content bar.city
#     expect(page).to have_content bar.state
#     expect(page).to have_content bar.zip
#     expect(page).to have_css("img[src*='nautilus_shell.jpg']")
#   end
# end

# Commented out since this test was based on populated from the database, not React.
