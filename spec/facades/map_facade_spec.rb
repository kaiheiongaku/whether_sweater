require 'rails_helper'

describe MapFacade do
  describe 'happy path' do
    it 'can get lat and long from maps', :vcr do
      latlon = MapFacade.retrieve_latlon('mcallen,tx')

      expect(latlon).to eq({ lat: 26.196695,
                             lng: -98.235698 })
    end

    it 'can get travel time', :vcr do
      time = MapFacade.retrieve_travel_time('mcallen, tx', 'harlingen, tx')
      expect(time).to eq('00:35:46')
    end
  end

  describe 'sad path' do
    it 'case does not matter', :vcr do
      latlon = MapFacade.retrieve_latlon('McAlLeN,TX')

      expect(latlon).to eq({ lat: 26.196695,
                             lng: -98.235698 })
    end
  end
end
