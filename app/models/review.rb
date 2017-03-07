class Review < ApplicationRecord
  validates :username, presence: true
  validates :drinks, presence: true, numericality: { greater_than_or_equal: 0, less_than_or_equal: 1, message: 'must be between 0 and 1'}
  validates :food, presence: true, numericality: { greater_than_or_equal: 0, less_than_or_equal: 1, message: 'must be between 0 and 1'}
  validates :entertainment, presence: true, numericality: { greater_than_or_equal: 0, less_than_or_equal: 1, message: 'must be between 0 and 1'}
  validates :vibe, presence: true, numericality: { greater_than_or_equal: 0, less_than_or_equal: 1, message: 'must be between 0 and 1'}
  validates :decor, presence: true, numericality: { greater_than_or_equal: 0, less_than_or_equal: 1, message: 'must be between 0 and 1'}
  validates :description, presence: true, length: { greater_than_or_equal: 150, message: 'must be at least 150 characters' }

  belongs_to :bar
end
