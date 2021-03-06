class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :user_detail
  has_many :room_users
  has_many :rooms, through: :room_users
  has_many :pets
  has_many :adoption

  validates :nickname, presence: true
  validates :password, format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/ }
  validates :full_name,      presence: true
  validates :full_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :phone_number,   presence: true, format: { with: /\A[0-9]{10,11}\z/ }
  validates :birthday,       presence: true
end
