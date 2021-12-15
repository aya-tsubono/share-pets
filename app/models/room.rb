class Room < ApplicationRecord
  has_many :room_users
  has_many :users, through: :room_users, validate: false
  belongs_to :pet

  validates :room_name, presence: true, length: { maximum: 40 }
end
