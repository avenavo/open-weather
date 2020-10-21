# frozen_string_literal: true

class ForecastObject < Dry::Struct
  attribute :dt, Types::Integer
  attribute :main do
    attribute :temp, Types::Coercible::Float
    attribute :feels_like, Types::Coercible::Float
    attribute :temp_min, Types::Coercible::Float
    attribute :temp_max, Types::Coercible::Float
    attribute :pressure, Types::Coercible::Float
    attribute :sea_level, Types::Coercible::Float
    attribute :grnd_level, Types::Coercible::Float
    attribute :humidity, Types::Coercible::Float
    attribute :temp_kf, Types::Coercible::Float
  end
  attribute :weather, Types::Array do
    attribute :id, Types::Integer
    attribute :main, Types::String
    attribute :description, Types::String
    attribute :icon, Types::String
  end
  attribute :clouds do
    attribute :all, Types::Coercible::Float
  end
  attribute :wind do
    attribute :speed, Types::Coercible::Float
    attribute :deg, Types::Coercible::Float
  end
  attribute :visibility, Types::Coercible::Float
  attribute :pop, Types::Coercible::Float
  attribute :sys do
    attribute :pod, Types::String
  end
  attribute :dt_txt, Types::String
end
