require 'rails_helper'

describe 'sessions request' do
  describe 'post a session' do
    describe 'happy path' do
      it 'returns the api_key' do
        user = User.create!(email: 'whatever@example.com', password: 'password')
        headers = { 'ACCEPT' => 'application/json' }
        params = { "user": {
                  "email": "whatever@example.com",
                  "password": "password"
                           }
                }
        post '/api/v1/sessions', params: params, headers: headers

        expect(response.content_type).to eq('application/json')
        expect(response.status).to eq(200)

        parsed = JSON.parse(response.body, symbolize_names: true)
        expect(parsed).to be_a(Hash)
        expect(parsed).to have_key(:data)
        expect(parsed[:data].keys).to eq([:id, :type, :attributes])
        expect(parsed[:data][:attributes].keys).to eq([:email, :api_key])

        expect(parsed[:data][:attributes][:email]).to eq(user.email)
        expect(parsed[:data][:attributes][:api_key]).to eq(user.api_key)
      end
    end

    describe 'sad path' do
      it 'returns an error if the password is wrong' do
        user = User.create!(email: 'whatever@example.com', password: 'password')
        headers = { 'ACCEPT' => 'application/json' }
        params = { "user": {
                  "email": "whatever@example.com",
                  "password": "incorrectpassword",
                           }
                }
        post '/api/v1/sessions', params: params, headers: headers

          expect(response.status).to eq(400)
        error = JSON.parse(response.body, symbolize_names: true)[:error]
        expect(error).to eq("Though you may insist, this email & password combo does not exist.")
      end

      it 'returns an error if the user does not have an account' do
        user = User.create!(email: 'whatever@example.com', password: 'password')
        headers = { 'ACCEPT' => 'application/json' }
        params = { "user": {
                  "email": "rob@toocoolforschool.com",
                  "password": "password",
                           }
                }
        post '/api/v1/sessions', params: params, headers: headers
        expect(response.status).to eq(400)
        error = JSON.parse(response.body, symbolize_names: true)[:error]
        expect(error).to eq("Though you may insist, this email & password combo does not exist.")
      end

      it 'returns an error if the password is missing' do
        user = User.create!(email: 'whatever@example.com', password: 'password')
        headers = { 'ACCEPT' => 'application/json' }
        params = { "user": {
                  "email": "whatever@example.com"
                           }
                }
        post '/api/v1/sessions', params: params, headers: headers
        expect(response.status).to eq(400)
        error = JSON.parse(response.body, symbolize_names: true)[:error]
        expect(error).to eq("Though you may insist, this email & password combo does not exist.")
      end

      it 'returns an error if the email is missing' do
        user = User.create!(email: 'whatever@example.com', password: 'password')
        headers = { 'ACCEPT' => 'application/json' }
        params = { "user": {
                  "password": "password",
                           }
                }
        post '/api/v1/sessions', params: params, headers: headers
        expect(response.status).to eq(400)
        error = JSON.parse(response.body, symbolize_names: true)[:error]
        expect(error).to eq("Though you may insist, this email & password combo does not exist.")
      end
    end
  end
end
