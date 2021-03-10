require 'rails_helper'

describe FoodService do
  it 'returns restaurant info', :vcr do
    endpoint = '/v3/businesses/search?'
    params = { location: 'harlingen,tx',
               term: 'burger',
               limit: 1,
               open_now: true}
    response = FoodService.call_restaurant_db(endpoint, params)

    expect(response).to be_a(Hash)
    expect(response).to have_key(:name)
    expect(response).to have_key(:location)
  end
end
