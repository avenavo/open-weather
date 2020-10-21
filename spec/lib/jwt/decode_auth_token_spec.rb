# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Jwt::DecodeAuthToken, type: :service do
  let!(:user) { create(:user) }

  let(:generated_token) { Jwt::GenerateAuthToken.new(user).call }

  describe '.payload' do
    subject { described_class.new(generated_token).payload }

    before do
      allow(Time).to receive(:now).and_return(Time.now)
    end

    it 'returns decoded payload' do
      expect(subject).to include(
        user_id: user.id, email: user.email,
        exp: Jwt::GenerateAuthToken::EXPIRES_IN.from_now.to_i
      )
    end
  end
end
