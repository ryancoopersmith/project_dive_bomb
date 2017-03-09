class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  after_create :send_email

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true, uniqueness: true
  validates :email, format: { with: /\A((\w+)|(\.))+\@[a-z]+\.[a-z]{3}\z/ }
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :admin, inclusion: { in: [true, false] }

  has_many :reviews, dependent: :destroy

  mount_uploader :profile_photo, ProfilePhotoUploader

  def self.admin?
    admin == true
  end

  def send_email
    UserMailer.new_user(self).deliver
  end
end
