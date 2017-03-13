# require 'rails_helper'
#
# describe Api::V1::ReviewsController do
#   let(:bar) { FactoryGirl.create!(:bar) }
#   let(:review) { FactoryGirl.create!(:review, :bar, bar) }
#   let(:admin) { FactoryGirl.create!(:user, admin: true) }
#
#   it 'should be successful' do
#     visit new_user_session_path
#     fill_in 'Email', with: admin.email
#     fill_in 'Password', with: admin.password
#     click_button 'Sign In'
#     visit '/api/v1/reviews.json'
#
#     response.should be_success
#   end
#
#   it 'responds with JSON' do
#     visit new_user_session_path
#     fill_in 'Email', with: admin.email
#     fill_in 'Password', with: admin.password
#     click_button 'Sign In'
#     visit '/api/v1/reviews.json'
#
#     body = JSON.parse(response.body)
#     expect(body[0]['description']).to eq(review.description)
#   end
# end
