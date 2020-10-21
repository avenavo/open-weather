# frozen_string_literal: true

class ForecastRepository
  def initialize(adapter = OpenWeather::Forecast.new)
    @adapter = adapter
  end

  def by_external_id(external_id)
    response = adapter.fetch_by_id(external_id)
    response.body['list'].map do |entry|
      ForecastObject.new(entry.deep_symbolize_keys)
    end
  end

  private

  attr_reader :adapter
end
