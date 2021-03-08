require 'rails_helper'

describe DailyWeather do
  it 'exists' do
    daily_weather_info =
          {
            "dt": 1615744800,
            "sunrise": 1615725781,
            "sunset": 1615768872,
            "temp": {
                "day": 77.83,
                "min": 58.17,
                "max": 80.78,
                "night": 66.61,
                "eve": 77.97,
                "morn": 58.17
            },
            "feels_like": {
                "day": 67.59,
                "night": 57.42,
                "eve": 69.39,
                "morn": 49.84
            },
            "pressure": 1021,
            "humidity": 17,
            "dew_point": 22.59,
            "wind_speed": 11.23,
            "wind_deg": 353,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "clouds": 0,
            "pop": 0,
            "uvi": 10
          }
    daily = DailyWeather.new(daily_weather_info)
    expect(daily).to be_a(DailyWeather)
  end

  it 'has attributes' do
    daily_weather_info =
          {
            "dt": 1615744800,
            "sunrise": 1615725781,
            "sunset": 1615768872,
            "temp": {
                "day": 77.83,
                "min": 58.17,
                "max": 80.78,
                "night": 66.61,
                "eve": 77.97,
                "morn": 58.17
            },
            "feels_like": {
                "day": 67.59,
                "night": 57.42,
                "eve": 69.39,
                "morn": 49.84
            },
            "pressure": 1021,
            "humidity": 17,
            "dew_point": 22.59,
            "wind_speed": 11.23,
            "wind_deg": 353,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "clouds": 0,
            "pop": 0,
            "uvi": 10
          }
    daily = DailyWeather.new(daily_weather_info)
    expect(daily.date).to eq('2021-03-14')
    expect(daily.sunrise).to eq('2021-03-14 07:43:01 -0500')
    expect(daily.sunset).to eq('2021-03-14 19:41:12 -0500')
    expect(daily.max_temp).to eq(80.78)
    expect(daily.min_temp).to eq(58.17)
    expect(daily.conditions).to eq('clear sky')
    expect(daily.icon).to eq('01d')
  end
end
