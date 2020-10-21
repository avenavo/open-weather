# frozen_string_literal: true

module Jwt
  class RevokeToken < ApplicationService
    def initialize(auth_token)
      @auth_token = auth_token
    end

    def call
      RevokedToken.create!(token: auth_token)
    end

    private

    attr_reader :auth_token
  end
end
