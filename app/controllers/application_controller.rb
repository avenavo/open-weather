# frozen_string_literal: true

class ApplicationController < ActionController::API
  rescue_from Api::ParamsValidator::InvalidParams, with: :bad_request

  private

  def bad_request(exception)
    render json: { messages: ['Invalid params'], errors: JSON.parse(exception.message) }, status: 400
  end
end
