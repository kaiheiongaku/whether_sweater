require 'rails_helper'

describe Munchy do
  it 'exists and has attributes' do
    hash = {:travel_time=>"00:35:46",
            :forecast=>{:temperature=>75.07, :summary=>"overcast clouds"},
            :restaurant=>
              Restaurant.new({:id=>"SrHsmBvQlU024zZT7Vjgfw",
                        :alias=>"frankie-flav-s-craft-burger-house-harlingen",
                        :name=>"Frankie Flav’s Craft Burger House",
                        :image_url=>"https://s3-media3.fl.yelpcdn.com/bphoto/r0sRPK6P84qENBPq-jph3A/o.jpg",
                        :is_closed=>false,
                        :url=>
                        "https://www.yelp.com/biz/frankie-flav-s-craft-burger-house-harlingen?adjust_creative=Gq9gbQnvEHSbOhWZ2bZRIQ&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=Gq9gbQnvEHSbOhWZ2bZRIQ",
                        :review_count=>29,
        :categories=>
          [{:alias=>"newamerican", :title=>"American (New)"},
           {:alias=>"gastropubs", :title=>"Gastropubs"},
           {:alias=>"burgers", :title=>"Burgers"}],
        :rating=>4.0,
        :coordinates=>{:latitude=>26.199145, :longitude=>-97.681261},
        :transactions=>["pickup", "delivery"],
        :location=>
          {:address1=>"711 N 77 Sunshine Strip",
           :address2=>"",
           :address3=>nil,
           :city=>"Harlingen",
           :zip_code=>"78550",
           :country=>"US",
           :state=>"TX",
           :display_address=>["711 N 77 Sunshine Strip", "Harlingen, TX 78550"]},
           :phone=>"+19562305050",
           :display_phone=>"(956) 230-5050",
           :distance=>1412.3564370952188})}
    munchy = Munchy.new(hash, 'harlingen,tx')

    expect(munchy).to be_a(Munchy)
    expect(munchy.restaurant).to be_a(Restaurant)
    expect(munchy.forecast).to eq({:temperature=>75.07, :summary=>"overcast clouds"})
    expect(munchy.travel_time).to eq('00 hours, 35 minutes')
    expect(munchy.destination_city).to eq('harlingen,tx')
  end
end
