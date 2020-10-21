# frozen_string_literal: true

module OpenWeather
  class Response
    attr_reader :status, :message, :body

    def initialize(response)
      @body = JSON.parse(response)
      @status = body['cod']
      @message = body['message']
    end

    def success?
      status == '200'
    end
  end
end
