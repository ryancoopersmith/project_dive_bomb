require 'rails_helper'

describe "bars" do
  it "is valid with valid attributes" do
    bar = FactoryGirl.create(:bar)
    expect(bar).to be_valid
  end

  it "it is not valid without a name" do
    bar = FactoryGirl.create(:bar)
    bar.name = ''
    expect(bar).to_not be_valid
  end

  it "it is not valid without an address" do
    bar = FactoryGirl.create(:bar)
    bar.address = ''
    expect(bar).to_not be_valid
  end

  it "it is not valid without a city" do
    bar = FactoryGirl.create(:bar)
    bar.city = ''
    expect(bar).to_not be_valid
  end

  it "it is not valid without a state" do
    bar = FactoryGirl.create(:bar)
    bar.state = ''
    expect(bar).to_not be_valid
  end

  it "it is not valid without a zip" do
    bar = FactoryGirl.create(:bar)
    bar.zip = ''
    expect(bar).to_not be_valid
  end

  it "it is not valid without a phone_number" do
    bar = FactoryGirl.create(:bar)
    bar.phone_number = ''
    expect(bar).to_not be_valid
  end

  it "it is not valid without a rating" do
    bar = FactoryGirl.create(:bar)
    bar.rating = ''
    expect(bar).to_not be_valid
  end

  it "it is not valid an incorrect zip" do
    bar = FactoryGirl.create(:bar)
    bar.zip = '999999'
    expect(bar).to_not be_valid
  end

  it "it is not valid with an incorrect phone number" do
    bar = FactoryGirl.create(:bar)
    bar.phone_number = '(999)-888-888'
    expect(bar).to_not be_valid
  end

  it "it is not valid with a duplicate phone number" do
    bar = FactoryGirl.create(:bar)
    bar.phone_number = '610-222-9900'
    expect(FactoryGirl.build(:bar, phone_number: '610-222-9900')).to_not be_valid
  end

  it "it is not valid with a duplicate address" do
    bar = FactoryGirl.create(:bar)
    bar.address = '321 Peanut Drive'
    expect(FactoryGirl.build(:bar, address: '321 Peanut Drive')).to_not be_valid
  end
end
