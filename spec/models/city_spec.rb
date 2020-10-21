# frozen_string_literal: true

require 'rails_helper'

RSpec.describe City, type: :model do
  it { expect(build(:city)).to be_valid }
end
