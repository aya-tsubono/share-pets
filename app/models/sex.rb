class Sex < ActiveHash::Base
  self.data = [
    { id: 1, name: 'オス' },
    { id: 2, name: 'メス' },
    { id: 3, name: '不明' }
  ]

  include ActiveHash::Associations
  has_many :pets
end
