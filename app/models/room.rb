class Room < ApplicationRecord
  has_many :room_users
  has_many :users, through: :room_users, validate: false
  has_many :messages, dependent: :destroy
  belongs_to :pet, optional: true

  validates :room_name, presence: true, length: { maximum: 40 }
  validates :pet_id, presence: true
end
