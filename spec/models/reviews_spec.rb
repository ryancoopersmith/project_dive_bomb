require 'rails_helper'

describe Review do
    it { should validate_presence_of(:user) }
    it { should_not allow_value("").for(:user) }

    it { should validate_presence_of(:bar) }
    it { should_not allow_value("").for(:bar) }

    it { should validate_presence_of(:drinks) }
    it { should validate_presence_of(:food) }
    it { should validate_presence_of(:setting) }
    it { should validate_presence_of(:entertainment) }
    it { should validate_presence_of(:vibe) }
    it { should_not allow_value(11).for(:vibe) }
    it { should_not allow_value(-1).for(:vibe) }

end
