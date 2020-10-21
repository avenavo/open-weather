# frozen_string_literal: true

module UsersCities
  class Create < ApplicationService
    def initialize(user, city_h)
      @user = user
      @city_h = city_h
    end

    def call
      ActiveRecord::Base.transaction do
        city = City.find_or_initialize_by(name: city_h['name'], country: city_h['country'], external_id: city_h['id'])
        city.save!
        user.users_cities.create!(city: city)
      end
    end

    private

    attr_reader :user, :city_h
  end
end
