class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one :user_detail
  
  validates :nickname,       presence: true
  validates :password,                       format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/ }
  validates :full_name,      presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :full_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :phone_number,   presence: true, format: { with: /\A[0-9]{10,11}\z/ }
       
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }

end
