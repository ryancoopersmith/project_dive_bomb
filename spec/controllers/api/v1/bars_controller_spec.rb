require "rails_helper"

RSpec.describe Api::V1::BarsController, type: :controller do
  describe "GET #index" do
    let(:bar1) { FactoryGirl.create(:bar) }
    let(:bar2) { FactoryGirl.create(:bar) }
    let(:user) { FactoryGirl.create(:user) }
    let(:bar1review) { FactoryGirl.create(:review, bar: bar1, user: user) }
    let(:bar2review)  { FactoryGirl.create(:review, bar: bar2, user: user) }

    it "should return all bars and their associated reviews" do
      get :index
      json = JSON.parse(response.body)
    end
  end
end
