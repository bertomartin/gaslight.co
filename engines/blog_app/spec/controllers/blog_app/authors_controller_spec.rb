require 'spec_helper'

module BlogApp
  describe AuthorsController do

    describe '#index' do
      it 'returns a collection of all authors as JSON' do
        get :index, format: 'json', use_route: :blog
        json = JSON.parse(response.body)
        json['authors'].size.should == Author.all.size
      end
    end

  end
end