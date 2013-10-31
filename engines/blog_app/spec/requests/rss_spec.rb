require 'spec_helper'

module BlogApp
  describe "RSS" do
    it 'gives me some rss' do
      get 'http://gaslight.co/blog/rss'
      expect(response.status).to eq(200)
      expect(response.content_type.symbol).to eq(:rss)
    end
  end
end