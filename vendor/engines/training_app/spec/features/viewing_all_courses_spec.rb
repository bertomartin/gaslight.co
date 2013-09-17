require 'spec_helper'

feature "Viewing all courses" do
  let!(:course) { FactoryGirl.create(:course, title: "Regular Course") }
  let!(:venue) { FactoryGirl.create(:venue, city: "Chicago") }
  let!(:featured_course) { FactoryGirl.create(:course, title: "Featured", synopsis: "synopsis", featured: true, start_date: Date.today, venue: venue) }
  let(:course_index_page) { CourseIndexPage.new }

  scenario "with featured courses" do
    course_index_page.visit_page(course)
    expect(course_index_page.featured_course_title).to eq("Featured")
    expect(course_index_page.featured_course_synopsis).to eq("synopsis")
    expect(course_index_page.featured_course_location).to eq("Chicago")
  end
end