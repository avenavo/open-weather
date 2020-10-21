# frozen_string_literal: true

module Api
  module Sessions
    class CreateValidator < Dry::Validation::Contract
      params do
        required(:email).filled(:string)
        required(:password).filled(:string)
      end
    end
  end
end
