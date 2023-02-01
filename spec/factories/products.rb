FactoryBot.define do
  factory :product do
    title {Faker::Lorem.sentence}
    explanation {Faker::Lorem.sentence}
    association :user 
    category_id          {2}
    status_id            {2}
    delivery_charge_id   {2}
    prefecture_id        {2}
    scheduled_day_id     {2}
    price                {1000}

    

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
