require 'spec_helper'

feature 'Posts index' do
  background { FactoryGirl.create_list(:post, 5) }
  let(:post_index_page) { PostIndexPage.new }

  scenario 'with no arguments' do
    post_index_page.visit_page
    post_index_page.full_posts.should have(3).items
  end
end

