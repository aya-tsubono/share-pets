class Pet < ApplicationRecord
  belongs_to :user

  validates :title,       presence: true, length: { maximum: 40 }
  validates :animal_name, presence: true, length: { maximum: 20 }
  validates :breed,       presence: true, length: { maximum: 50 }
  validates :status,      presence: true, length: { maximum: 1000 }
  validates :area,        presence: true, length: { maximum: 200 }
  validates :reason,      presence: true, length: { maximum: 500 }
  validates :status,      presence: true, length: { maximum: 1000 }
  validates :charge,      presence: true,                           inclusion: { in: 0..9_999_999 }, format: { with: /\A[0-9]+\z/ }, numericality: true
  validates :condition,   presence: true, length: { maximum: 500 }

end
