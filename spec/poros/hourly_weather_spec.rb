require 'rails_helper'

describe HourlyWeather do
  it 'exists' do
    hourly_weather_info = {
            "dt": 1615154400,
            "temp": 69.6,
            "feels_like": 64.69,
            "pressure": 1024,
            "humidity": 49,
            "dew_point": 49.62,
            "uvi": 0.67,
            "clouds": 90,
            "visibility": 10000,
            "wind_speed": 8.66,
            "wind_deg": 82,
            "weather": [
                { "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04d" }
                        ]
                }
    hourly = HourlyWeather.new(hourly_weather_info)
    expect(hourly).to be_an(HourlyWeather)
  end

  it 'has attributes' do
    hourly_weather_info = {
            "dt": 1615154400,
            "temp": 69.6,
            "feels_like": 64.69,
            "pressure": 1024,
            "humidity": 49,
            "dew_point": 49.62,
            "uvi": 0.67,
            "clouds": 90,
            "visibility": 10000,
            "wind_speed": 8.66,
            "wind_deg": 82,
            "weather": [
                { "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04d" }
                        ]
                }
    hourly = HourlyWeather.new(hourly_weather_info)
    expect(hourly.time).to eq('1600')
    expect(hourly.temperature).to eq(69.6)
    expect(hourly.conditions).to eq('overcast clouds')
    expect(hourly.icon).to eq('04d')
  end
end
