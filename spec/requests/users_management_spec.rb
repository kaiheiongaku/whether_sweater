require 'rails_helper'

describe 'users requests' do
  describe 'post request for user do' do
    describe 'happy path' do
      it 'creates a user' do
        headers = { 'ACCEPT' => 'application/json' }
        params = { "user": {
                  "email": "whatever@example.com",
                  "password": "password",
                  "password_confirmation": "password"}
                }
        post '/api/v1/users', params: params, headers: headers

        expect(response.content_type).to eq('application/json')
        expect(response.status).to eq(201)

        parsed = JSON.parse(response.body, symbolize_names: true)
        expect(parsed).to be_a(Hash)
        expect(parsed).to have_key(:data)
        expect(parsed[:data].keys).to eq([:id, :type, :attributes])
        expect(parsed[:data][:attributes].keys).to eq([:email, :api_key])
      end
    end
  end
end
