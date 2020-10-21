# frozen_string_literal: true

module OpenWeather
  class Forecast
    def initialize(city, client = OpenWeather::Client.new)
      @city = city
      @client = client
    end

    def fetch(options = {})
      client.forecast(city, options)
    end

    private

    attr_reader :client, :url, :city
  end
end
