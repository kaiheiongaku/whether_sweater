require 'rails_helper'

describe WeatherService do
  describe 'returns the weather' do
    it 'has three types of weather data', :vcr do
      endpoint = '/data/2.5/onecall?'
      params = {lat: 26.196695,
                lon: -98.235698
               }
      weather_data = WeatherService.call_weather_db(endpoint, params)

      expect(weather_data).to be_a(Hash)

      expect(weather_data).to have_key(:current)
      expect(weather_data).to have_key(:daily)
      expect(weather_data).to have_key(:hourly)

      expect(weather_data).to_not have_key(:minutely)
    end

    it 'has current_weather', :vcr do
      endpoint = '/data/2.5/onecall?'
      params = {lat: 26.196695,
                lon: -98.235698
               }
      current_weather = WeatherService.call_weather_db(endpoint, params)[:current]

      expect(current_weather).to be_a(Hash)

      expect(current_weather).to have_key(:dt)
      expect(current_weather).to have_key(:sunrise)
      expect(current_weather).to have_key(:sunset)

      expect(current_weather).to have_key(:temp)
      expect(current_weather[:temp]).to be_a(Float).or(be_an(Integer))

      expect(current_weather).to have_key(:feels_like)
      expect(current_weather[:feels_like]).to be_a(Float).or(be_an(Integer))

      expect(current_weather).to have_key(:humidity)
      expect(current_weather[:humidity]).to be_a(Float).or(be_an(Integer))

      expect(current_weather).to have_key(:uvi)
      expect(current_weather[:uvi]).to be_a(Float).or(be_an(Integer))

      expect(current_weather).to have_key(:visibility)
      expect(current_weather[:visibility]).to be_a(Float).or(be_an(Integer))

      expect(current_weather).to have_key(:weather)
      expect(current_weather[:weather][0]).to have_key(:description)
      expect(current_weather[:weather][0][:description]).to be_a(String)
      expect(current_weather[:weather][0]).to have_key(:icon)
      expect(current_weather[:weather][0][:icon]).to be_a(String)
    end

    it 'has hourly_weather', :vcr do
      endpoint = '/data/2.5/onecall?'
      params = {lat: 26.196695,
                lon: -98.235698
              }
      hourly_weather = WeatherService.call_weather_db(endpoint, params)[:hourly]

      expect(hourly_weather).to be_an(Array)
      expect(hourly_weather.count).to eq(48)
      expect(hourly_weather.first).to be_a(Hash)
      expect(hourly_weather.first).to have_key(:dt)

      expect(hourly_weather.first).to have_key(:temp)
      expect(hourly_weather.first[:temp]).to be_a(Float).or(be_an(Integer))

      expect(hourly_weather.first).to have_key(:weather)

      expect(hourly_weather.first[:weather][0]).to have_key(:description)
      expect(hourly_weather.first[:weather][0][:description]).to be_a(String)

      expect(hourly_weather.first[:weather][0]).to have_key(:icon)
      expect(hourly_weather.first[:weather][0][:icon]).to be_a(String)
    end

    it 'has daily weather', :vcr do
      endpoint = '/data/2.5/onecall?'
      params = {lat: 26.196695,
                lon: -98.235698
              }
      daily_weather = WeatherService.call_weather_db(endpoint, params)[:daily]

      expect(daily_weather).to be_an(Array)
      expect(daily_weather.count).to eq(8)

      expect(daily_weather.first).to be_a(Hash)
      expect(daily_weather.first).to have_key(:dt)
      expect(daily_weather.first[:dt]).to be_an(Integer)
      expect(daily_weather.first).to have_key(:sunrise)
      expect(daily_weather.first[:sunrise]).to be_an(Integer)
      expect(daily_weather.first).to have_key(:sunset)
      expect(daily_weather.first[:sunset]).to be_an(Integer)

      expect(daily_weather.first).to have_key(:temp)
      expect(daily_weather.first[:temp]).to be_a(Hash)
      expect(daily_weather.first[:temp]).to have_key(:max)
      expect(daily_weather.first[:temp][:max]).to be_a(Float).or(be_an(Integer))

      expect(daily_weather.first[:temp]).to have_key(:min)
      expect(daily_weather.first[:temp][:min]).to be_a(Float).or(be_an(Integer))

      expect(daily_weather.first).to have_key(:weather)

      expect(daily_weather.first[:weather][0]).to have_key(:description)
      expect(daily_weather.first[:weather][0][:description]).to be_a(String)

      expect(daily_weather.first[:weather][0]).to have_key(:icon)
      expect(daily_weather.first[:weather][0][:icon]).to be_a(String)
    end
  end
end
