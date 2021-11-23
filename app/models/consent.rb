class Consent < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '同居者の同意を得ている' },
    { id: 3, name: 'これから同意を得る予定' },
    { id: 4, name: '単身者のため同居者がいない' },
    { id: 5, name: 'その他' },
  ]

  include ActiveHash::Associations
  has_many :user_details
end