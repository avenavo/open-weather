# frozen_string_literal: true

module OpenWeather
  class Forecast
    def initialize(client = OpenWeather::Client.new)
      @client = client
    end

    def fetch_by_name(name, options = {})
      client.forecast(options.merge(q: name))
    end

    def fetch_by_id(id, options = {})
      client.forecast(options.merge(id: id))
    end

    private

    attr_reader :client, :url, :city
  end
end
