require 'rails_helper'

describe MapService do
  describe 'gets lattitude and longitude' do
    it 'returns latlon only', :vcr do
      endpoint = '/geocoding/v1/address?'
      params = { location: 'mcallen,tx' }

      latlon = MapService.call_map_db(endpoint, params)

      expect(latlon).to be_a(Hash)
      expect(latlon.keys.size).to eq(2)

      expect(latlon).to have_key(:lat)
      expect(latlon[:lat]).to be_a(Float)

      expect(latlon).to have_key(:lng)
      expect(latlon[:lng]).to be_a(Float)
    end

    it 'returns only time', :vcr do
      enpoint = '/directions/v2/route?'
      params = { from: 'mcallen,tx', to: 'harlingen,tx' }

      time = MapService.call_directions_db(enpoint, params)

      expect(time).to be_a(String)
      expect(time).to eq("00:35:46")
    end
  end
end
