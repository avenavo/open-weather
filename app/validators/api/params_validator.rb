# frozen_string_literal: true

module Api
  class ParamsValidator
    InvalidParams = Class.new(StandardError)

    def initialize(validator)
      @validator = validator
    end

    def validate!(params)
      result = validator.new.call(params.to_unsafe_h)
      raise InvalidParams, result.errors.to_h.to_json unless result.success?
    end

    private

    attr_reader :validator
  end
end
