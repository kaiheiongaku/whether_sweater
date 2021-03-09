class BackgroundsService
  class << self
    def call_background_db(endpoint, params = {})
      response = connection.get(endpoint) do |request|
        request.params = params
        request.headers[:Authorization] = "Client-ID #{ENV['Image_api_key']}"
        request.headers['Accept-Version'] = 'v1'
      end
      JSON.parse(response.body, symbolize_names: true)
    end

    private
    def connection
      Faraday.new('https://api.unsplash.com')
    end
  end
end
