require 'spec_helper'

feature "Viewing all courses" do
  let(:course_index_page) { CourseIndexPage.new }

  describe "in the appropriate sections" do
    let!(:in_person_course) { FactoryGirl.create(:in_person_course, title: "In Person") }
    let!(:online_course) { FactoryGirl.create(:online_course, title: "Online") }
    scenario do
      course_index_page.visit_page
      expect(course_index_page.online_course_titles).to include("Online")
      expect(course_index_page.online_course_titles).to_not include("In Person")

      expect(course_index_page.in_person_course_titles).to include("In Person")
      expect(course_index_page.in_person_course_titles).to_not include("Online")
    end
  end

  describe "active and inactive" do
    let!(:active_course) { FactoryGirl.create(:online_course, active: true, title: "Active course") }
    let!(:inactive_course) { FactoryGirl.create(:online_course, active: false, title: "Inactive course") }
    scenario "shows on only active courses" do
      course_index_page.visit_page
      expect(course_index_page.course_titles).to include("Active course")
      expect(course_index_page.course_titles).to_not include("Inactive course")
    end
  end
end