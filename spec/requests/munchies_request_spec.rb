require 'rails_helper'

describe 'restaurant recommendation', :vcr do
  it 'provides the necessary information' do
    get '/api/v1/munchies?start=denver,co&destination=pueblo,co&food=hamburger'

    expect(response).to be_successful
    rec_info = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(rec_info).to have_key(:id)
    expect(rec_info[:id]).to eq('null')

    expect(rec_info).to have_key(:type)
    expect(rec_info[:type]).to eq('munchies')

    expect(rec_info).to have_key(:attributes)
    expect(rec_info[:attributes]).to have_key(:destination_city)
    expect(rec_info[:attributes]).to have_key(:travel_time)
    expect(rec_info[:attributes]).to have_key(:forecast)
    expect(rec_info[:attributes][:forecast]).to have_key(:summary)
    expect(rec_info[:attributes][:forecast]).to have_key(:temperature)

    expect(rec_info).to have_key(:restaurant)
    expect(rec_info[:restaurant]).to have_key(:name)
    expect(rec_info[:restaurant]).to have_key(:address)
  end
end
