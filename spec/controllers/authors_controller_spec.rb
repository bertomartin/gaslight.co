require 'spec_helper'

describe AuthorsController do

  describe '#index' do
    it 'returns a collection of all authors as JSON' do
      get :index, format: 'json'
      json = JSON.parse(response.body)
      json['authors'].size.should == Author.all.size
    end
  end

end
