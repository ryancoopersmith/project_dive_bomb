class Bar < ApplicationRecord

  validates :state, presence: true
  validates :zip, presence: true, length: { is: 5 }
  validates :phone_number, presence: true, uniqueness: true, format: { with: /\A\(?\d{3}\)?\-?\d{3}\-?\d{4}\z/ }
  validates :rating, presence: true
  validates :name, presence: true
  validates :address, presence: true, uniqueness: true
  validates :city, presence: true
end
