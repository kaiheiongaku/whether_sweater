require 'rails_helper'

describe CurrentWeather do
  it 'exists' do
    current_weather_info = {
        "dt": 1615157116,
        "sunrise": 1615121421,
        "sunset": 1615163861,
        "temp": 69.6,
        "feels_like": 64.38,
        "pressure": 1024,
        "humidity": 49,
        "dew_point": 49.62,
        "uvi": 0.22,
        "clouds": 90,
        "visibility": 10000,
        "wind_speed": 9.22,
        "wind_deg": 80,
        "weather": [
            {
                "id": 804,
                "main": "Clouds",
                "description": "overcast clouds",
                "icon": "04d"
            }
        ]
    }

    current = CurrentWeather.new(current_weather_info)
    expect(current).to be_a(CurrentWeather)
  end

  it 'has attributes' do
    current_weather_info = {
        "dt": 1615157116,
        "sunrise": 1615121421,
        "sunset": 1615163861,
        "temp": 69.6,
        "feels_like": 64.38,
        "pressure": 1024,
        "humidity": 49,
        "dew_point": 49.62,
        "uvi": 0.22,
        "clouds": 90,
        "visibility": 10000,
        "wind_speed": 9.22,
        "wind_deg": 80,
        "weather": [
            {
                "id": 804,
                "main": "Clouds",
                "description": "overcast clouds",
                "icon": "04d"
            }
        ]
    }

    current = CurrentWeather.new(current_weather_info)

    expect(current.datetime).to be_a(String)
    expect(current.sunrise).to be_a(String)
    expect(current.sunset).to be_a(String)
    expect(current.temperature).to eq(69.6)
    expect(current.feels_like).to eq(64.38)
    expect(current.humidity).to eq(49)
    expect(current.uvi).to eq(0.22)
    expect(current.visibility).to eq(10000)
    expect(current.conditions).to eq('overcast clouds')
    expect(current.icon).to eq('04d')

  end
end
