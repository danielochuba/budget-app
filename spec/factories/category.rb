FactoryBot.define do
  factory :category do
    name { Faker::Lorem.word }
    icon { Faker::Lorem.word }
    user
  end
end
