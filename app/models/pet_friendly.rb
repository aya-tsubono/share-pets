class PetFriendly < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '現在ペット可住宅に住んでいる' },
    { id: 3, name: '今後ペット可住宅に転居予定' },
    { id: 4, name: 'その他' },
  ]

  include ActiveHash::Associations
  has_many :user_details
end