class WeatherService
  class << self
    def call_weather_db(endpoint, params = {})
      response = connection.get(endpoint) do |request|
        request.params = params
        request.params[:appid] = ENV['Weather_api_id']
        request.params[:exclude] = 'minutely, alerts'
        request.params[:units] = 'imperial'
      end
      JSON.parse(response.body, symbolize_names: true)
    end

    private
    def connection
      Faraday.new('https://api.openweathermap.org')
    end
  end
end
