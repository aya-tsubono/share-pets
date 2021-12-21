class Castration < ActiveHash::Base
  self.data = [
    { id: 1, name: '避妊去勢済み' },
    { id: 2, name: '避妊去勢していない' },
    { id: 3, name: '譲渡までに実施予定' }
  ]

  include ActiveHash::Associations
  has_many :pets
end
