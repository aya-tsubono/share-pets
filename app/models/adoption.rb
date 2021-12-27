class Adoption < ApplicationRecord
  belongs_to :pet
  belongs_to :user, optional: true

  validates :pet_id, presence: true
  validates :user_id, presence: true
end
