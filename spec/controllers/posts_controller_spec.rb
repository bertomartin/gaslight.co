require 'spec_helper'

describe PostsController do
  context 'GET #index' do
    before { FactoryGirl.create(:post) }

    it "doesn't error when the author doesn't exist" do
      get :index, author: 'Not Person'
      response.should be_success
    end
  end
end
