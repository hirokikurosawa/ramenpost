FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    nickname { Faker::Lorem.characters(number:10) }
    email { Faker::Internet.email }
    icon{ Faker::Lorem.characters(number:10) }
    password { 'password' }
    password_confirmation { 'password' }
  end
end