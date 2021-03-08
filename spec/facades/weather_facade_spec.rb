require 'rails_helper'

describe WeatherFacade do
  describe 'pulls weather data' do
    it 'returns the whole hash of weather data', :vcr do
      latitude_longitude = { lat: 26.196695,
                             lng: -98.235698 }
      weather_data = WeatherFacade.pull_weather_data(latitude_longitude)
      expect(weather_data).to be_a(Hash)
      expect(weather_data).to have_key(:current)
      expect(weather_data).to have_key(:daily)
      expect(weather_data).to have_key(:hourly)
    end
  end
end
