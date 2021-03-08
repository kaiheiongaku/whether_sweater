require 'rails_helper'

describe Forecast do
  it 'exists' do
    weather_file = File.read('spec/fixtures/poros/forecast_spec.json')
    weather_data = JSON.parse(weather_file, symbolize_names: true)
    jumbo_weather = Forecast.new(weather_data)

    expect(jumbo_weather).to be_a(Forecast)
  end

  it 'has attributes' do
    weather_file = File.read('spec/fixtures/poros/forecast_spec.json')
    weather_data = JSON.parse(weather_file, symbolize_names: true)
    jumbo_weather = Forecast.new(weather_data)

    expect(jumbo_weather.id).to eq(nil)
    expect(jumbo_weather.current_weather).to be_a(CurrentWeather)
    expect(jumbo_weather.daily_weather).to be_a(Array)
    expect(jumbo_weather.hourly_weather).to be_an(Array)
  end
end
