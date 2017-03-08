class Review < ApplicationRecord
  validates :user, presence: true
  validates :bar, presence: true
  validates :drinks, numericality: { only_integer: true, greater_than_or_equal: 1, less_than_or_equal: 5 }
  validates :food, numericality: { only_integer: true, greater_than_or_equal: 1, less_than_or_equal: 5 }
  validates :entertainment, numericality: { only_integer: true, greater_than_or_equal: 1, less_than_or_equal: 5 }
  validates :vibe, numericality: { only_integer: true, greater_than_or_equal: 1, less_than_or_equal: 5 }
  validates :setting, numericality: { only_integer: true, greater_than_or_equal: 1, less_than_or_equal: 5 }

  belongs_to :bar
  belongs_to :user
end
