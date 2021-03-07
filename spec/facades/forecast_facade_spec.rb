require 'rails_helper'

describe 'forecast facade' do
  describe 'happy path' do
    it 'can get lat and long from maps' do
      latlon = ForecastFacade.retrieve_latlon('mcallen,tx')

      expect(latlon).to eq({lattitude: 'xxx', longitude: 'yyy'})
    end
  end

  describe 'sad path' do
    it 'case does not matter' do
      latlon = ForecastFacade.retrieve_latlon('McAlLeN,TX')

      expect(latlon).to eq({lattitude: 'xxx', longitude: 'yyy'})
    end
  end
end
