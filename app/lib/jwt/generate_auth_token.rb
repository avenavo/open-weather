# frozen_string_literal: true

module Jwt
  class GenerateAuthToken
    HMAC_SECRET = ENV['HMAC_SECRET']
    EXPIRES_IN = 24.hours

    def initialize(user)
      @user = user
    end

    def call
      JWT.encode(payload, HMAC_SECRET, 'HS256')
    end

    private

    attr_reader :user

    def payload
      { user_id: user.id, email: user.email, exp: EXPIRES_IN.from_now.to_i }
    end
  end
end
