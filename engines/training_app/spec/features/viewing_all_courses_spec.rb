require 'spec_helper'

feature "Viewing all courses" do
  let(:course_index_page) { CourseIndexPage.new }

  describe "in the appropriate sections" do
    let!(:in_person_course) { FactoryGirl.create(:course, title: "In Person", online: false, synopsis: "synopsis") }
    let!(:online_course) { FactoryGirl.create(:course, title: "Online", online: true, synopsis: "synopsis") }
    scenario do
      course_index_page.visit_page
      expect(course_index_page.online_course_titles).to include("Online")
      expect(course_index_page.online_course_titles).to_not include("In Person")

      expect(course_index_page.in_person_course_titles).to include("In Person")
      expect(course_index_page.in_person_course_titles).to_not include("Online")
    end
  end

  describe "active and inactive" do
    let!(:active_course) { FactoryGirl.create(:course, active: true, title: "Active course") }
    let!(:inactive_course) { FactoryGirl.create(:course, active: false, title: "Inactive course") }
    scenario "shows on only active courses" do
      course_index_page.visit_page
      expect(course_index_page.course_titles.size).to eq(1)
      expect(course_index_page.course_titles).to include("Active course")
    end
  end
end