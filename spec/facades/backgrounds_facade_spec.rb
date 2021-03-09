require 'rails_helper'

describe BackgroundsFacade do
  describe 'images' do
    it 'creates an image object', :vcr do
      image = BackgroundsFacade.retrieve_background('denver,co')

      expect(image).to be_a(Background)
      expect(image.url).to be_a(String)
      expect(image.credit).to be_a(Hash)
      expect(image.credit[:author]).to be_a(String)
      expect(image.credit[:profile]).to be_a(String)
    end
  end
end
