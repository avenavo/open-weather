# frozen_string_literal: true

require 'net/http'

module OpenWeather
  class Client
    HOST = 'https://api.openweathermap.org/data/2.5'

    def initialize(api_key: Rails.configuration.open_weather_token)
      @api_key = api_key
    end

    def forecast(city, options = {})
      url = "#{HOST}/forecast"
      fetch(url, options.merge(q: city))
    end

    def fetch(url, options = {})
      uri = URI(url)
      uri.query = URI.encode_www_form(options.merge(appid: api_key))
      response = Net::HTTP.get(uri)
      OpenWeather::Response.new(response)
    end

    private

    attr_reader :api_key
  end
end
