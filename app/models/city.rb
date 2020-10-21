# frozen_string_literal: true

class City < ApplicationRecord
  has_many :users_cities, dependent: :destroy
end
