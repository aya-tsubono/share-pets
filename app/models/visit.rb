class Visit < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '自宅訪問実施可能' },
    { id: 3, name: '自宅訪問実施不可' },
  ]

  include ActiveHash::Associations
  has_many :user_details
end