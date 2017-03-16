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

      expect(json["bars"].length).to eq(2)
      expect(json["bars"][0]["name"]).to eq("bar1")
      expect(json["bars"][1]["name"]).to eq("bar2")

      expect(json["bars"][0]["reviews"].length).to eq(1)
      expect(json["bars"][1]["reviews"].length).to eq(1)

      expect(json["bars"][0]["reviews"][0]["id"]).to eq(bar1.id)
      expect(json["bars"][1]["reviews"][0]["id"]).to eq(bar2.id)
    end
  end
end
