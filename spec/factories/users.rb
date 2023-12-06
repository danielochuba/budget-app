FactoryBot.define do
  factory :user do
    name { 'John Doe' }
    email { Faker::Internet.email }
    password { 'password123' }
  end
end
