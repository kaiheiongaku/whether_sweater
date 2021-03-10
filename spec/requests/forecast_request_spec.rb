require 'rails_helper'

describe 'request weather forecast information' do
  describe 'happy path', :vcr do
    it 'returns weather hash'do
      get '/api/v1/forecast?location=mcallen,tx'

      expect(response).to be_successful

      weather_json = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(weather_json).to be_a(Hash)

      expect(weather_json).to have_key(:id)
      expect(weather_json[:id]).to eq('null')

      expect(weather_json).to have_key(:type)
      expect(weather_json[:type]).to eq('forecast')

      expect(weather_json[:attributes]).to have_key(:current_weather)
      expect(weather_json[:attributes]).to have_key(:daily_weather)
      expect(weather_json[:attributes]).to have_key(:hourly_weather)
      expect(weather_json[:attributes].keys.size).to eq(3)
    end

    it 'has current_weather' do
      get '/api/v1/forecast?location=mcallen,tx'

      expect(response).to be_successful

      current_weather = JSON.parse(response.body, symbolize_names: true)[:data][:attributes][:current_weather]

      expect(current_weather).to be_a(Hash)

      expect(current_weather).to have_key(:datetime)
      expect(current_weather).to have_key(:sunrise)
      expect(current_weather).to have_key(:sunset)

      expect(current_weather).to have_key(:temperature)
      expect(current_weather[:temperature]).to be_a(Float).or(be_an(Integer))

      expect(current_weather).to have_key(:feels_like)
      expect(current_weather[:feels_like]).to be_a(Float).or(be_an(Integer))

      expect(current_weather).to have_key(:humidity)
      expect(current_weather[:humidity]).to be_a(Float).or(be_an(Integer))

      expect(current_weather).to have_key(:uvi)
      expect(current_weather[:uvi]).to be_a(Float).or(be_an(Integer))

      expect(current_weather).to have_key(:visibility)
      expect(current_weather[:visibility]).to be_a(Float).or(be_an(Integer))

      expect(current_weather).to have_key(:conditions)
      expect(current_weather[:conditions]).to be_a(String)

      expect(current_weather).to have_key(:icon)
      expect(current_weather[:icon]).to be_a(String)

      expect(current_weather).not_to have_key(:pressure)
      expect(current_weather).not_to have_key(:dew_point)
      expect(current_weather).not_to have_key(:clouds)
      expect(current_weather).not_to have_key(:wind_speed)
      expect(current_weather).not_to have_key(:wind_deg)
    end

    it 'has daily_weather' do
      get '/api/v1/forecast?location=mcallen,tx'

      expect(response).to be_successful

      daily_weather = JSON.parse(response.body, symbolize_names: true)[:data][:attributes][:daily_weather]

      expect(daily_weather).to be_an(Array)
      expect(daily_weather.count).to eq(5)

      expect(daily_weather.first).to be_a(Hash)
      expect(daily_weather.first).to have_key(:date)
      expect(daily_weather.first).to have_key(:sunrise)
      expect(daily_weather.first).to have_key(:sunset)

      expect(daily_weather.first).to have_key(:max_temp)
      expect(daily_weather.first[:max_temp]).to be_a(Float).or(be_an(Integer))

      expect(daily_weather.first).to have_key(:min_temp)
      expect(daily_weather.first[:min_temp]).to be_a(Float).or(be_an(Integer))

      expect(daily_weather.first).to have_key(:conditions)
      expect(daily_weather.first[:conditions]).to be_a(String)

      expect(daily_weather.first).to have_key(:icon)
      expect(daily_weather.first[:icon]).to be_a(String)

      expect(daily_weather.first).not_to have_key(:feels_like)
      expect(daily_weather.first).not_to have_key(:wind_pressure)
      expect(daily_weather.first).not_to have_key(:humidity)
      expect(daily_weather.first).not_to have_key(:dew_point)
      expect(daily_weather.first).not_to have_key(:wind_speed)
      expect(daily_weather.first).not_to have_key(:wind_deg)
      expect(daily_weather.first).not_to have_key(:weather)
      expect(daily_weather.first).not_to have_key(:pop)
      expect(daily_weather.first).not_to have_key(:clouds)
      expect(daily_weather.first).not_to have_key(:uvi)
    end

    it 'has hourly_weather' do
      get '/api/v1/forecast?location=mcallen,tx'

      expect(response).to be_successful

      hourly_weather = JSON.parse(response.body, symbolize_names: true)[:data][:attributes][:hourly_weather]

      expect(hourly_weather).to be_an(Array)
      expect(hourly_weather.count).to eq(8)

      expect(hourly_weather.first).to be_a(Hash)
      expect(hourly_weather.first).to have_key(:time)

      expect(hourly_weather.first).to have_key(:temperature)
      expect(hourly_weather.first[:temperature]).to be_a(Float).or(be_an(Integer))

      expect(hourly_weather.first).to have_key(:conditions)
      expect(hourly_weather.first[:conditions]).to be_a(String)

      expect(hourly_weather.first).to have_key(:icon)
      expect(hourly_weather.first[:icon]).to be_a(String)

      expect(hourly_weather.first).not_to have_key(:feels_like)
      expect(hourly_weather.first).not_to have_key(:pressure)
      expect(hourly_weather.first).not_to have_key(:humidity)
      expect(hourly_weather.first).not_to have_key(:dew_point)
      expect(hourly_weather.first).not_to have_key(:uvi)
      expect(hourly_weather.first).not_to have_key(:clouds)
      expect(hourly_weather.first).not_to have_key(:visibility)
      expect(hourly_weather.first).not_to have_key(:wind_speed)
      expect(hourly_weather.first).not_to have_key(:wind_deg)
      expect(hourly_weather.first).not_to have_key(:weather)
    end
  end

  describe 'sad path' do
    it 'has case insensitivity', :vcr do
      get '/api/v1/forecast?location=mCaLlEn,Tx'

      expect(response).to be_successful
    end

    it 'can handle a space', :vcr do
      get '/api/v1/forecast?location=mcallen, tx'

      expect(response).to be_successful
    end

    # it 'has an error if the request does not have a state', :vcr do
    #   get '/api/v1/forecast?location=williamsport'
    #
    #   expect(response.status).to eq(404)
    # end
    #
    # it 'presents an error if the request does not have a city', :vcr do
    #   get '/api/v1/forecast?location=tx'
    #
    #   expect(response.status).to eq(404)
    # end

    it 'works if the state is spelled out', :vcr do
      get '/api/v1/forecast?location=mcallen,texas'

      expect(response).to be_successful
    end
  end
end
