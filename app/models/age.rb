class Age < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '６ヶ月未満' },
    { id: 3, name: '６ヶ月〜２歳' }
    { id: 4, name: '３歳〜６歳' }
    { id: 5, name: '７歳以上' }
  ]

  include ActiveHash::Associations
  has_many :pets
end
