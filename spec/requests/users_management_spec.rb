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

        # body = {
        #         "data": {
        #           "type": "users",
        #           "id": "1",
        #           "attributes": {
        #             "email": "whatever@example.com",
        #             "api_key": "jgn983hy48thw9begh98h4539h4"
        #           }
        #         }
        #       }
        expect(response.body).to be_a(Hash)
        expect(response.body).to have_key('data')
        expect(response.body.keys).to eq('type', 'id', 'attributes')
        expect(response.body[:data][:attributes].keys).to eq(['email', 'api_key'])

      end
    end
  end
end
