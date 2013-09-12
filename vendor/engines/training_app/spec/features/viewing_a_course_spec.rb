require 'spec_helper'

feature "Viewing a course" do
  let(:instructor) { FactoryGirl.create(:instructor) }
  let(:course) { FactoryGirl.create(:course, instructors: [instructor]) }
  let(:course_show_page) { CourseShowPage.new }
  scenario "with an course with instructors" do
    course_show_page.visit_page(course)
    expect(course_show_page).to have_instructor_name(instructor.name)
    expect(course_show_page).to have_instructor_bio(instructor.bio)
    expect(course_show_page).to have_instructor_image(instructor.image_url)
  end
end