class Munchy
  attr_reader :travel_time, :forecast, :restaurant
  def initialize(info)
    @travel_time = info[:travel_time]
    @forecast = info[:forecast]
    @restaurant = info[:restaurant]
  end
end
