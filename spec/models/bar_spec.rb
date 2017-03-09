require 'rails_helper'


describe Bar do

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:state) }
  it { should validate_presence_of(:zip) }
  it { should validate_presence_of(:phone_number) }

  it { should validate_length_of(:zip) }


  it "should have a unique address" do
    expect { FactoryGirl.create(:bar, address: "123 Steet") }.to_not raise_error
    expect { FactoryGirl.create(:bar, address: "123 Steet") }.to raise_error
  end

  it "should have a unique phone number" do
    expect{ FactoryGirl.create(:bar, phone_number: "215-215-2155") }.to_not raise_error
    expect{ FactoryGirl.create(:bar, phone_number: "215-215-2155") }.to raise_error
  end
end
