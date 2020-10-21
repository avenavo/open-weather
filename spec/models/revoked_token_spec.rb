# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RevokedToken, type: :model do
  it { expect(build(:revoked_token)).to be_valid }
end
