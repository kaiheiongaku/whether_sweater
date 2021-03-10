require 'rails_helper'

describe BackgroundsService do
  describe 'backgrounds' do
    it 'returns an image JSON', :vcr do
      endpoint = '/search/photos'
      params = { query: 'los angeles,ca skyline',
                 per_page: 1 }

      image = BackgroundsService.call_background_db(endpoint, params)

      expect(image).to be_a(Hash)
      expect(image).to have_key(:results)
      expect(image[:results].first.keys.size).to eq(19)
    end
  end
end
