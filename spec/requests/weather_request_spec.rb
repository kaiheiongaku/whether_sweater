require 'rails_helper'

describe 'request weather forecast information' do
  it 'returns weather hash' do
    get '/api/v1/forecast?location=mcallen,tx'

    expect(response).to be_successful

    weather_json = JSON.parse(response.body, symbolize_names: true)

    expect(weather_json).to be_a(Hash)

    expect(weather_json).to have_key(:id)
    expect(weather_json[:id]).to eq('null')

    expect(weather_json).to have_key(:type)
    expect(weather_json[:type]).to eq('forecast')

    expect(weather_json[:attributes]).to have_key(:current_weather)
    expect(weather_json[:attributes]).to have_key(:daily_weather)
    expect(weather_json[:attributes]).to have_key(:hourly_weather)
    #also test not_have
  end

  it 'has current_weather' do
    get '/api/v1/forecast?location=mcallen,tx'

    expect(response).to be_successful

    current_weather = JSON.parse(response.body, symbolize_names: true)[:attributes][:current_weather]

    expect(current_weather).to be_a(Hash)

    expect(current_weather).to have_key(:datetime)
    #verify date formats for these
    expect(current_weather).to have_key(:sunrise)
    expect(current_weatherset).to have_key(:sunset)

    expect(current_weather).to have_key(:temperature)
    expect(current_weather[:temperature]).to be_a(Float)
    #need something to verify farenheight

    expect(current_weather).to have_key(:feels_like)
    #verify Farenheight

    expect(current_weather).to have_key(:humidity)
    #expect(current_weather_a(Number)

    expect(current_weather).to have_key(:uvi)
    #expect(current_weathermber)

    expect(current_weather).to have_key(:visibility)
    #expect(current_weatherbe_a(Number)

    expect(current_weather).to have_key(:description)
    expect(current_weather[:visibility]).to be_a(String)

    expect(current_weather).to have_key(:icon)
    expect(current_weather[:icon]).to be_a(String)
    #test not_have
  end

  it 'has daily_weather' do
    get '/api/v1/forecast?location=mcallen,tx'

    expect(response).to be_successful

    daily_weather = JSON.parse(response.body, symbolize_names: true)[:attributes][:daily_weather]

    expect(daily_weather).to be_an(Array)
    expect(daily_weather.count).to eq(5)

    expect(daily_weather.first).to be_a(Hash)
    expect(daily_weather.first).to have_key(:date)
    #verify date format
    expect(daily_weather.first).to have_key(:sunrise)
    #verify datetime format
    expect(daily_weather.first).to have_key(:sunset)
    #verify datetime format

    expect(daily_weather.first).to have_key(:max_temp)
    expect(daily_weather.first[:max_temp]).to be_a(Float)
    #also verify Farenheight
    expect(daily_weather.first).to have_key(:min_temp)
    expect(daily_weather.first[:min_temp]).to be_a(Float)
    #also verify Farenheight

    expect(daily_weather.first).to have_key(:conditions)
    expect(daily_weather.first[:conditions]).to be_a(String)

    expect(daily_weather.first).to have_key(:icon)
    expect(daily_weather.first[:icon]).to be_a(String)
    #not have
  end

  it 'has hourly_weather' do
    get '/api/v1/forecast?location=mcallen,tx'

    expect(response).to be_successful

    hourly_weather = JSON.parse(response.body, symbolize_names: true)[:attributes][:hourly_weather]

    expect(hourly_weather).to be_an(Array)
    expect(hourly_weather.count).to eq(8)

    expect(hourly_weather.first).to be_a(Hash)
    expect(hourly_weather.first).to have_key(:time)
    #verify time format

    expect(hourly_weather.first).to have_key(:temp)
    expect(hourly_weather.first[:temp]).to be_a(Float)
    #verify farenheight

    expect(hourly_weather.first).to have_key(:conditions)
    expect(hourly_weather.first[:conditions]).to be_a(String)

    expect(hourly_weather.first).to have_key(:icon)
    expect(hourly_weather.first[:icon]).to be_a(String)
    #not_have
  end
end
