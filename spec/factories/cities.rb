# frozen_string_literal: true

FactoryBot.define do
  factory :city do
    name { Faker::Address.city }
    country { Faker::Address.country_code }
    external_id { Faker::Number.number(digits: 5) }
  end
end
