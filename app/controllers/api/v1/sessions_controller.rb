# frozen_string_literal: true

module Api
  module V1
    class SessionsController < ApplicationController
      before_action :authenticate_user!, only: :destroy

      def destroy
        ::Jwt::RevokeToken.new(auth_token).call
        render json: {}, status: 200
      end

      def create
        Api::ParamsValidator.new(Api::Sessions::CreateValidator).validate!(params)

        user = User.find_by(email: params[:email])

        if user.nil? || !user.authenticate(params[:password])
          render json: { messages: ['Invalid credentials'] }, status: 422
          return
        end

        token = Jwt::GenerateAuthToken.new(user).call

        render json: { token: token }, status: 201
      end
    end
  end
end
