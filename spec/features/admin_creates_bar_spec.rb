require 'rails_helper'

#[]If user tries to create a new bar via new_bar_path they are unable
#[]If admin tries to create a new bar via new_bar_path they are successful

feature 'create a bar link is only available to admin' do
  let(:user) {FactoryGirl.create(:user)}
  
  scenario 'user visits homepage and does not see link to create a new bar'
end
