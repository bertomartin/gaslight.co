require 'spec_helper'

module BlogApp
  describe PostsController do
    context 'GET #index' do
      before { FactoryGirl.create(:post) }

      it "doesn't error when the author doesn't exist" do
        get :index, author: 'Not Person', use_route: :blog
        response.should be_success
      end
    end
  end
end