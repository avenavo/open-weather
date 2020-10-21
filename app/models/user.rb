# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  has_many :users_cities, dependent: :destroy
  has_many :cities, through: :users_cities
end
