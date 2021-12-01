class Pet < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :title,       presence: true, length: { maximum: 50 }
  validates :animal_name, presence: true, length: { maximum: 50 }
  validates :breed,       presence: true, length: { maximum: 50 }
  validates :status,      presence: true, length: { maximum: 1000 }
  validates :area,        presence: true, length: { maximum: 200 }
  validates :reason,      presence: true, length: { maximum: 500 }
  validates :charge,      presence: true, inclusion: { in: 0..9_999_999 }, format: { with: /\A[0-9]+\z/ }, numericality: true
  validates :condition,   presence: true, length: { maximum: 500 }
  validates :image,       presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :animal_category
  belongs_to :sex
  belongs_to :age
  belongs_to :weight
  belongs_to :prefecture
  belongs_to :vaccination
  belongs_to :castration

  validates :animal_category_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :sex_id,             presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :age_id,             presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :weight_id,          presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id,      presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :vaccination_id,     presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :castration_id,      presence: true, numericality: { other_than: 1, message: "can't be blank" }

end
