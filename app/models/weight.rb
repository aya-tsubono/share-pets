class Weight < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '小型犬' },
    { id: 3, name: '中型犬' }
    { id: 4, name: '大型犬' }
    { id: 5, name: '（猫）６キロ未満' }
    { id: 5, name: '（猫）６キロ以上' }
    { id: 5, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :pets
end
