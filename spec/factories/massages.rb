FactoryBot.define do
  factory :massage do
    content {Faker::Lorem.sentence}
    association :user
    association :room

    after(:build) do |message|
      message.image.attach(io: File.open('assets/images/sample.jpg'), filename: 'sample.jpg')
    end

  end
end
