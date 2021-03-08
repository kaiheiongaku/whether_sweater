class HourlyWeather
  attr_reader :time, :temperature, :conditions, :icon

  def initialize(hourly_info)
    @time = Time.at(hourly_info[:dt]).to_datetime.strftime('%H%M')
    @temperature = hourly_info[:temp]
    @conditions = hourly_info[:weather][0][:description]
    @icon = hourly_info[:weather][0][:icon]
  end
end
