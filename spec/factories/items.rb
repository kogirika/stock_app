FactoryBot.define do
  factory :item do
    name                      { Faker::Food.fruits }
    stock                     { Faker::Number.between(from: 0, to: 100) }
    price                     { Faker::Number.between(from: 0, to: 100_000) }
    category_id               { Faker::Number.between(from: 0, to: 3) }
    association :user
  end
end
