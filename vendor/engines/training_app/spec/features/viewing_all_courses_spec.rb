require 'spec_helper'

feature "Viewing all courses" do
  let(:venue) { FactoryGirl.create(:venue, city: "Chicago") }
  let(:course_index_page) { CourseIndexPage.new }

  context "with an in person featured courses" do
    let!(:in_person_featured_course) { FactoryGirl.create(:course, title: "In Person", synopsis: "synopsis", featured: true, start_date: Date.today, venue: venue) }

    scenario "viewing the featured course" do
      course_index_page.visit_page
      expect(course_index_page.featured_course_title).to eq("In Person")
      expect(course_index_page.featured_course_synopsis).to eq("synopsis")
      expect(course_index_page.featured_course_meta).to match("Chicago")
    end
  end

  context "with an online featured course" do
    let!(:online_featured_course) { FactoryGirl.create(:course, title: "Online", synopsis: "synopsis", featured: true, start_date: nil, venue: nil) }

    scenario "viewing the featured course" do
      course_index_page.visit_page
      expect(course_index_page.featured_course_title).to eq("Online")
      expect(course_index_page.featured_course_synopsis).to eq("synopsis")
      expect(course_index_page.featured_course_meta).to eq("Online")
    end
  end
end