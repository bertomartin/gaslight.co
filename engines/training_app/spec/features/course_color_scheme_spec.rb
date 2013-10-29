require 'spec_helper'

feature "Course color theme", js: true do
  let(:course) { FactoryGirl.create(:course, color_primary: "#E14A30", color_secondary: "#A53727" ) }
  let(:classroom_page) { ClassroomPage.new }
  scenario "load the proper theme file" do
    classroom_page.visit_course(course)
    expect(classroom_page.theme_url).to match("training/courses/#{course.id}/theme.css")
  end
end