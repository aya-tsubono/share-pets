FactoryBot.define do
  factory :room do
    room_name { Faker::Team.name }
    association :pet
  end
end
