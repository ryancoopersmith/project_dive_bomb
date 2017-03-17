class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  after_create :send_email

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true, uniqueness: true
  validates :email, uniqueness: true, format: { with: /\A((\w+)|(\.))+\@[a-z]+\.[a-z]{3}\z/ }
  validates :password, presence: true, on: :create
  validates :password_confirmation, presence: true, on: :create
  validates :admin, inclusion: { in: [true, false] }

  has_many :votes, dependent: :destroy
  has_many :reviews, through: :votes, dependent: :destroy

  mount_uploader :profile_photo, ProfilePhotoUploader

  def admin?
    admin == true
  end

  def send_email
    UserMailer.new_user(self).deliver
  end
end
