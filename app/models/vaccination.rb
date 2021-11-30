class Vaccination < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '接種済み' },
    { id: 3, name: '未接種' }
    { id: 4, name: '譲渡までに接種予定' }
  ]

  include ActiveHash::Associations
  has_many :pets
end
