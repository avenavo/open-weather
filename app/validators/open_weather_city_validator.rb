# frozen_string_literal: true

class OpenWeatherCityValidator
  InvalidCity = Class.new(StandardError)

  def initialize(params)
    @params = params
  end

  def validate!
    raise InvalidCity, forecast.message unless forecast.success?

    forecast.body['city']
  end

  private

  attr_reader :params

  def forecast
    @forecast ||= OpenWeather::Forecast.new.fetch_by_name("#{params[:city_name]}, #{params[:country_code]}")
  end
end
