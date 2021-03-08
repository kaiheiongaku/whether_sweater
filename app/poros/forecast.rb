class Forecast
  require 'date'
  attr_reader :id,
              :type,
              :current_weather,
              :daily_weather,
              :hourly_weather

  def initialize(weather)
    @id = nil
    @current_weather = CurrentWeather.new(weather[:current])
    @daily_weather = weather_by_day(weather[:daily])
    @hourly_weather = weather_by_hour(weather[:hourly])
  end

  def weather_by_day(weather)
    weather[0..4].map do |daily_weather_info|
      DailyWeather.new(daily_weather_info)
    end
  end

  def weather_by_hour(weather)
    weather[0..7].map do |hourly_weather_info|
      HourlyWeather.new(hourly_weather_info)
    end
  end
end
