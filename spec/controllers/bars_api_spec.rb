# require 'rails_helper'
#
# RSpec.describe BarsController do
#   let(:bar) { FactoryGirl.create(:bar) }
#   describe "GET 'index'" do
#     before(:each) do
#       get 'index', format: :json, id: bar.id
#     end
#
#     it 'should be successful' do
#       response.should be_success
#     end
#
#     it 'responds with JSON' do
#       body = JSON.parse(response.body)
#       binding.pry
#       expect(body[0]['name']).to eq(bar.name)
#     end
#   end
# end
