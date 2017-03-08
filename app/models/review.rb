class Review < ApplicationRecord
  validates :user, presence: true
  validates :bar, presence: true
  validate  :drinks, presence: true, numericality: { only_integer: true, greater_than_or_equal: 1, less_than_or_equal: 5 }
  validates :food, presence: true, numericality: { only_integer: true, greater_than_or_equal: 1, less_than_or_equal: 5 }
  validates :entertainment, presence: true, numericality: { only_integer: true, greater_than_or_equal: 1, less_than_or_equal: 5 }
  validates :vibe, presence: true, numericality: { only_integer: true, greater_than_or_equal: 1, less_than_or_equal: 5 }
  validates :decor, presence: true, numericality: { only_integer: true, greater_than_or_equal: 1, less_than_or_equal: 5 }
  validates :description

  belongs_to :bar
  belongs_to :user
end
