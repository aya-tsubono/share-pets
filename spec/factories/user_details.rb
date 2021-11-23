FactoryBot.define do
  factory :user_detail do
    birthday         { Faker::Date.backward }
    household_id     { Faker::Number.between(from: 2, to: 4) }
    experience       { Faker::Lorem.sentence }
    have_animal      { Faker::Lorem.sentence }
    pet_friendly_id  { Faker::Number.between(from: 2, to: 4) }
    desired_animal   { Faker::Lorem.sentences } 
    economic_status  { Faker::Lorem.sentence }
    deposit          { Faker::Lorem.sentence }
    have_surgery_id  { Faker::Number.between(from: 2, to: 3) }
    get_vaccine_id   { Faker::Number.between(from: 2, to: 3) }
    indoor_outdoor   { Faker::Lorem.sentence }
    visit_id         { Faker::Number.between(from: 2, to: 3) }
    consent_id       { Faker::Number.between(from: 2, to: 5) }
    remarks          { Faker::Lorem.sentences }
  end
end