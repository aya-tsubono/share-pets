class UserDetail < ApplicationRecord
  belongs_to :user, optional: true

  validates :birthday, presence: true
end
