# frozen_string_literal: true

module Api
  module V1
    class RegistrationsController < ApplicationController
      before_action :authenticate_user!, only: :destroy

      def create
        validated_params = ::Api::ParamsValidator.new(Api::Registrations::CreateValidator).validate!(params)
        ::Users::Create.call(validated_params.except(:password_confirmation))
        render json: {}, status: 201
      end

      def destroy
        ::Users::Destroy.call(current_user)
        render json: {}, status: 200
      end
    end
  end
end
