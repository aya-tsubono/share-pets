class Adoption < ApplicationRecord
  belongs_to :pet
  belongs_to :user

  validates :pet_id, presence: true
  validates :user_id, presence: true
end
