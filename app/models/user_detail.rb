class UserDetail < ApplicationRecord
  belongs_to :user, optional: true

  validates :birthday, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :household
  belongs_to :pet_friendly
  belongs_to :have_surgery
  belongs_to :get_vaccine
  belongs_to :visit
  belongs_to :consent

  validates :household_id,    numericality: { other_than: 1, message: "can't be blank" }
  validates :pet_friendly_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :have_surgery_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :get_vaccine_id,  numericality: { other_than: 1, message: "can't be blank" }
  validates :visit_id,        numericality: { other_than: 1, message: "can't be blank" }
  validates :consent_id,      numericality: { other_than: 1, message: "can't be blank" }

end
