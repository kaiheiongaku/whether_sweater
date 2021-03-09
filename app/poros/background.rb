class Background
  attr_reader :location, :url, :credit

  def initialize(location, background_json)
    @location = location
    @url = background_json[:results][0][:links][:html]
    @credit = create_credit(background_json[:results][0][:user])
  end

  def create_credit(credit_info)
    credit = Hash.new
    credit[:author] = credit_info[:name]
    credit[:profile] = credit_info[:links][:html]
    credit
  end
end
