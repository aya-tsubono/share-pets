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

  validates :household_id,    inclusion: { in: 1..4 }
  validates :pet_friendly_id, inclusion: { in: 1..4 }
  validates :have_surgery_id, inclusion: { in: 1..3 }
  validates :get_vaccine_id,  inclusion: { in: 1..3 }
  validates :visit_id,        inclusion: { in: 1..3 }
  validates :consent_id,      inclusion: { in: 1..5 }

end
