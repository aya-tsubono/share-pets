FactoryBot.define do
  factory :pet do
    title  {  }
    animal_name  {  }
    animal_category_id  {  }
    breed  {  }
    sex_id  {  }
    age_id  {  }
    weight_id  {  }
    prefecture_id  {  }
    vaccination_id  {  }
    castration_id  {  }
    area  {  }
    charge  {  }
    condition  {  }
    reason  {  }
    status  {  }
    association :user

    after(:build) do |pet|
      pet.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end
