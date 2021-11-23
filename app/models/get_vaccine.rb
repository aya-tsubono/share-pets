class GetVaccine < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '継続的にワクチン接種（狂犬病注射）を行います' },
    { id: 3, name: '継続的にワクチン接種（狂犬病注射）を行う予定はありません' },
  ]

  include ActiveHash::Associations
  has_many :user_details
end