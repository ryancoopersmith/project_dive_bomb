class Bar < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true, uniqueness: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true, length: { is: 5 }
  validates :phone_number, presence: true, uniqueness: true, format: { with: /\A\(?\d{3}\)?\-?\d{3}\-?\d{4}\z/ }

  has_many :reviews, dependent: :destroy 

  def self.search(term)
    if term
      where('lower(name) LIKE ? OR lower(address) LIKE ? OR lower(city) LIKE ? OR zip LIKE ?', "%#{term.downcase}%", "%#{term.downcase}%", "%#{term.downcase}%", "%#{term}%")
    else
      all
    end
  end
end
