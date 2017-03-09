require 'rails_helper'

describe Review do
  it { should belong_to(:user) }
  it { should have_valid(:user).when(User.new) }
  it { should_not have_valid(:user).when(nil) }

  it { should belong_to(:bar) }
  it { should have_valid(:bar).when(Bar.new) }
  it { should_not have_valid(:bar).when(nil) }

  it { should validate_presence_of(:drinks) }
  it { should validate_presence_of(:food) }
  it { should validate_presence_of(:setting) }
  it { should validate_presence_of(:entertainment) }
  it { should validate_presence_of(:vibe) }

  it { should validate_numericality_of(:drinks) }
  it { should validate_numericality_of(:food) }
  it { should validate_numericality_of(:setting) }
  it { should validate_numericality_of(:entertainment) }
  it { should validate_numericality_of(:vibe) }

  it { should_not allow_value(11).for(:vibe) }
  it { should_not allow_value(-1).for(:vibe) }
end
