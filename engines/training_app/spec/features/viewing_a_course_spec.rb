require 'spec_helper'

feature "Viewing a course" do
  context "in person" do
    let(:parent_course) { FactoryGirl.create(:course, registration_link: "google.com") }
    let(:course_show_page) { CourseShowPage.new }

    context "with instructors" do
      let!(:instructor) { FactoryGirl.create(:instructor, courses: [parent_course]) }
      scenario "shows the instructors" do
        course_show_page.visit_page(parent_course)
        expect(course_show_page).to have_instructor_name(instructor.name)
        expect(course_show_page).to have_instructor_bio(instructor.bio)
        expect(course_show_page).to have_instructor_image(instructor.image_url)
      end
    end

    describe "viewing registration_links" do
      let!(:child_course) { FactoryGirl.create(:course, parent_course: parent_course) }
      let!(:sibling_course1) { FactoryGirl.create(:course, parent_course: parent_course, registration_link: "foo.com") }
      let!(:sibling_course2) { FactoryGirl.create(:course, parent_course: parent_course, registration_link: "bar.com") }

      context "on a parent course" do
        scenario "shows the children's registration links" do
          course_show_page.visit_page(parent_course)
          expect(course_show_page).to have_registration_link("foo.com")
          expect(course_show_page).to have_registration_link("bar.com")
        end
      end

      context "on a child course" do
        scenario "shows the sibling's registration links" do
          course_show_page.visit_page(child_course)
          expect(course_show_page).to have_registration_link("foo.com")
          expect(course_show_page).to have_registration_link("bar.com")
        end
      end
    end
  end
end