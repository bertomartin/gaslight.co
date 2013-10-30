require 'spec_helper'

feature 'Blog Index' do
  background { FactoryGirl.create_list(:post, 5) }
  let(:blog_index_page) { BlogIndexPage.new }

  scenario 'with no arguments' do
    blog_index_page.visit_page
    blog_index_page.full_posts.should have(3).items
  end
end

