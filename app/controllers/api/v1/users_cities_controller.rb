# frozen_string_literal: true

module Api
  module V1
    class UsersCitiesController < ApplicationController
      before_action :authenticate_user!

      def create
        validated_params = ::Api::ParamsValidator.new(Api::UsersCities::CreateValidator).validate!(params)
        validated_city = ::OpenWeatherCityValidator.new(validated_params).validate!
        ::UsersCities::Create.call(current_user, validated_city)

        render json: {}, status: 201
      end
    end
  end
end
