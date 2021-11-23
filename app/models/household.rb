class Household < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '単身者世帯' },
    { id: 3, name: '高齢者世帯' },
    { id: 4, name: 'その他' },
  ]

  include ActiveHash::Associations
  has_many :user_details
end