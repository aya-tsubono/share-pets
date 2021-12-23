FactoryBot.define do
  factory :pet do
    title { Faker::Lorem.sentence }
    animal_name { Faker::Creature::Dog.name }
    animal_category_id { Faker::Number.between(from: 1, to: 3) }
    breed { Faker::Creature::Dog.breed }
    sex_id  { Faker::Number.between(from: 1, to: 3) }
    age_id  { Faker::Number.between(from: 1, to: 4) }
    weight_id { Faker::Number.between(from: 1, to: 6) }
    prefecture_id { Faker::Number.between(from: 1, to: 47) }
    vaccination_id { Faker::Number.between(from: 1, to: 3) }
    castration_id { Faker::Number.between(from: 1, to: 3) }
    area { Faker::Lorem.sentence }
    charge { Faker::Number.between(from: 0, to: 9_999_999) }
    condition { Faker::Lorem.sentences }
    reason  { Faker::Lorem.sentences }
    status  { Faker::Lorem.sentences }
    association :user

    after(:build) do |pet|
      pet.images.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
    end
  end
end
