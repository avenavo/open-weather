# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Jwt::GenerateAuthToken, type: :service do
  let!(:user) { create(:user) }

  describe '.call' do
    subject { described_class.new(user).call }

    it { expect(subject).to be_a(String) }
  end

  describe '.payload' do
    subject { described_class.new(user).send(:payload) }

    before do
      allow(Time).to receive(:now).and_return(Time.now)
    end

    it 'builds correct payload' do
      expect(subject).to eq(
        user_id: user.id, email: user.email, exp: described_class::EXPIRES_IN.from_now.to_i
      )
    end
  end
end
