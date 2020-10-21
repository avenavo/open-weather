# frozen_string_literal: true

module Api
  module V1
    class ForecastsController < ApplicationController
      before_action :authenticate_user!

      def show
        users_city = current_user.users_cities.eager_load(:city).find(params[:users_city_id])
        forecast = ForecastRepository.new.by_external_id(users_city.external_id)
        render json: { data: forecast.as_json }, status: 200
      end
    end
  end
end
