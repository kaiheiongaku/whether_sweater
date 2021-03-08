class CurrentWeather
  attr_reader :datetime,
              :sunrise,
              :sunset,
              :temperature,
              :feels_like,
              :humidity,
              :uvi,
              :visibility,
              :conditions,
              :icon

  def initialize(current_info)
    @datetime = Time.at(current_info[:dt]).to_time.to_s
    @sunrise = Time.at(current_info[:sunrise]).to_time.to_s
    @sunset = Time.at(current_info[:sunset]).to_time.to_s
    @temperature = current_info[:temp]
    @feels_like = current_info[:feels_like]
    @humidity = current_info[:humidity]
    @uvi = current_info[:uvi]
    @visibility = current_info[:visibility]
    @conditions = current_info[:weather][0][:description]
    @icon = current_info[:weather][0][:icon]
  end
end
