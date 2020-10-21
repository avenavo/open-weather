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

      def destroy
        ::UsersCities::Destroy.call(current_user, params)
        render json: {}, status: 200
      end

      def show
        users_city = current_user.users_cities.eager_load(:city).find(params[:id])
        render json: UsersCitySerializer.new(users_city).serializable_hash, status: 200
      end
    end
  end
end
