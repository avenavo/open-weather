Rails.application.configure do
  config.open_weather_token = ENV.fetch('OPEN_WEATHER_API_KEY')
end
