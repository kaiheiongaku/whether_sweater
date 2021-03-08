class MunchiesFacade
  class << self
    def destination_info(start, destination, food)
      response = MunchiesService.travel_breakdown(start, destination, food)
      Munchy.new(response, destination)
    end
  end

end
