# frozen_string_literal: true

module UsersCities
  class Destroy < ApplicationService
    def initialize(user, params)
      @user = user
      @params = params
    end

    def call
      users_city.destroy!
    end

    private

    attr_reader :user, :params

    def users_city
      user.users_cities.find(params[:id])
    end
  end
end
