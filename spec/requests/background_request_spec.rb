require 'rails_helper'

describe 'photo requests' do
  describe 'happy path' do
    it 'returns a photo for a city'  do
      get '/api/v1/backgrounds?location=denver,co'

      expect(response).to be_successful

      parsed = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(parsed).to be_a(Hash)

      expect(parsed).to have_key(:id)
      expect(parsed[:id]).to eq('null')

      expect(parsed).to have_key(:attributes)
      expect(parsed[:attributes].keys).to eq([:location, :url, :credit])
      expect(parsed[:attributes][:credit].keys).to eq([:source, :author, :logo])

      expect(parsed).to have_key(:type)
      expect(parsed[:type]).to eq('image')
    end
  end

  describe 'sad path' do

  end
end
