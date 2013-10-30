require 'spec_helper'

feature 'Posts show' do
  let(:post) { FactoryGirl.create(:post, title: "My Awesome Post", tag_list: "cincinnati, culture") }
  let!(:related_post) { FactoryGirl.create(:post, title: "My Related Post", tag_list: "cincinnati") }
  let(:post_show_page) { PostShowPage.new }
  background { post_show_page.visit_post(post) }

  scenario "title" do
    expect(post_show_page.title).to eq("My Awesome Post")
  end

  scenario "tags" do
    expect(post_show_page.tags).to include("cincinnati")
    expect(post_show_page.tags).to include("culture")
  end

  scenario "related" do
    expect(post_show_page.related_posts).to include("My Related Post")
  end
end

