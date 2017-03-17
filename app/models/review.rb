class Review < ApplicationRecord
  after_create :send_email

  validates :user, presence: true
  validates :bar, presence: true
  validates :drinks, presence: true,
  numericality: {
    only_integer: true,
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 5
  }
  validates :food, presence: true,
  numericality: {
    only_integer: true,
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 5
  }
  validates :entertainment, presence: true,
  numericality: {
    only_integer: true,
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 5
  }
  validates :vibe, presence: true,
  numericality: {
    only_integer: true,
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 5
  }
  validates :setting, presence: true,
  numericality: {
    only_integer: true,
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 5
  }

  belongs_to :bar
  belongs_to :user
  has_many :users

  def send_email
    User.all.each do |user|
      if user.admin?
        ReviewMailer.new_review(self, user).deliver
      end
    end
  end
end
