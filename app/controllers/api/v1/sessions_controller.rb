# frozen_string_literal: true

module Api
  module V1
    class SessionsController < ApplicationController
      def create
        Api::ParamsValidator.new(Api::Sessions::CreateValidator).validate!(params)

        user = User.find_by(email: params[:email])

        if user.nil? || !user.authenticate(params[:password])
          render json: { messages: ['Invalid credentials'] }, status: 422
          return
        end

        token = Jwt::GenerateAuthToken.new(user).call

        render json: { token: token }, status: 200
      end
    end
  end
end
