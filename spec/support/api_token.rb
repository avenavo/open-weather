# frozen_string_literal: true

module ApiToken
  def with_token_for(user)
    { 'HTTP_AUTHORIZATION' => "Bearer #{Jwt::GenerateAuthToken.new(user).call}" }
  end
end

RSpec.configure do |config|
  config.include ApiToken, type: :request
end
