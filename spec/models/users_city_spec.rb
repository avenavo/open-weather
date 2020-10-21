# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersCity, type: :model do
  it { expect(build(:users_city)).to be_valid }
end
