# frozen_string_literal: true

module Jwt
  class DecodeAuthToken
    HMAC_SECRET = ENV['HMAC_SECRET']

    attr_reader :token

    def initialize(token)
      @token = token
    end

    def payload
      @payload ||= decode[0].with_indifferent_access
    end

    private

    def decode
      JWT.decode(token, HMAC_SECRET, true, algorithm: 'HS256')
    end
  end
end
