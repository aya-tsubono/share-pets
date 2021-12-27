FactoryBot.define do
  factory :adoption do
    association :user
    association :pet
  end
end
