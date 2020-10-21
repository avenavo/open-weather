# frozen_string_literal: true

module Api
  module UsersCities
    class CreateValidator < Dry::Validation::Contract
      params do
        required(:city_name).filled(:string)
        optional(:country_code).filled(:string)
      end
    end
  end
end
