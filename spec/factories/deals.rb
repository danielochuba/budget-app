FactoryBot.define do
  factory :deal do
    name { 'Deal Name' }
    amount { 10.00 }
    association :category
  end
end
