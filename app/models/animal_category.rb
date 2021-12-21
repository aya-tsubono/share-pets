class AnimalCategory < ActiveHash::Base
  self.data = [
    { id: 1, name: '犬' },
    { id: 2, name: '猫' },
    { id: 3, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :pets
end
