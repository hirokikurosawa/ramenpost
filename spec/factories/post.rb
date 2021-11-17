FactoryBot.define do
  factory :post do
    introduction { Faker::Lorem.characters(number:20) }
    post_image_id { Faker::Lorem.characters(number:20) }

  end
end