FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password              { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation { password }
    full_name             { Faker::Name.name }
    full_name_kana        { "ヤマダタロウ" }
    phone_number          { Faker::Number.leading_zero_number(digits: 10) }
    prefecture_id         { Faker::Number.between(from: 2, to: 48) }
  end
end