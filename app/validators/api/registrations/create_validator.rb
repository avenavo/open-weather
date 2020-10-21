# frozen_string_literal: true

module Api
  module Registrations
    class CreateValidator < Dry::Validation::Contract
      params do
        required(:email).filled(:string)
        required(:password).filled(:string)
        required(:password_confirmation).filled(:string)
      end

      rule(:email) do
        key.failure('has invalid format') if value.present? && !/\A(\S+)@(.+)\.(\S+)\z/.match?(value)
      end

      rule(:password_confirmation) do
        key.failure('different than password') if values[:password] != value
      end
    end
  end
end
