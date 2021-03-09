class BackgroundsFacade
  class << self
    def retrieve_background(location)
      endpoint = '/search/photos'
      params = { query: "#{location} skyline",
                 per_page: 1 }
      response = BackgroundsService.call_background_db(endpoint, params)
      Background.new(location, response)
    end
  end
end
