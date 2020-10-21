# frozen_string_literal: true

FactoryBot.define do
  factory :users_city do
    association :user
    association :city
  end
end
