class HaveSurgery < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '不妊去勢手術を行う' },
    { id: 3, name: '不妊去勢手術を行わない' },
  ]

  include ActiveHash::Associations
  has_many :user_details
end