require 'rails_helper'

#[]If user tries to create a new bar via new_bar_path they are unable
#[]If admin tries to create a new bar via new_bar_path they are successful

feature 'create a bar link is only available to admin' do
  let(:user) {FactoryGirl.create(:user)}
  let(:admin) { FactoryGirl.create(:user, admin: true) }
  scenario 'Unauthorized user visits homepage and does not see button to create a new bar' do
    visit root_path

    expect(page).to_not have_link "Create Bar"
  end
end

#User tries to go direct to new path
#Unauthorized users tries "
#Admin tries to do this thing

#Admin creates new bar

#admin creates bars with errors (test flash notices)
