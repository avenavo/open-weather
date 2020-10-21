# frozen_string_literal: true

class ApplicationController < ActionController::API
  rescue_from Api::ParamsValidator::InvalidParams, with: :bad_request!
  rescue_from JWT::DecodeError, with: :unauthorized!

  private

  attr_reader :current_user

  def bad_request!(exception)
    render json: { messages: ['Invalid params'], errors: JSON.parse(exception.message) }, status: 400
  end

  def unauthorized!
    render json: { messages: ['Not signed in'] }, status: 401
  end

  def authenticate_user!
    user_id = Jwt::DecodeAuthToken.new(auth_token).payload[:user_id]
    @current_user = User.find_by(id: user_id)
    unauthorized! if token_revoked? || current_user.nil?
  end

  def auth_token
    bearer = /^Bearer /
    auth_header = request.headers['HTTP_AUTHORIZATION']
    return unless auth_header =~ bearer

    @auth_token ||= auth_header.gsub(bearer, '')
  end

  def token_revoked?
    RevokedToken.where(token: auth_token).any?
  end
end
