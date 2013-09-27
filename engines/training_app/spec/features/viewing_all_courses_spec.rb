require 'spec_helper'

feature "Viewing all courses" do
  let(:course_index_page) { CourseIndexPage.new }

  describe "featured courses" do
    let(:venue) { FactoryGirl.create(:venue, city: "Chicago") }

    context "with an in person featured course" do
      let!(:in_person_featured_course) { FactoryGirl.create(:course, title: "In Person", online: false, synopsis: "synopsis", featured: true, venue: venue) }

      scenario do
        course_index_page.visit_page
        expect(course_index_page.featured_course_title).to eq("In Person")
        expect(course_index_page.featured_course_synopsis).to eq("synopsis")
        expect(course_index_page.featured_course_meta).to match("Chicago")
        expect(course_index_page.featured_course_button).to match("Reserve your seat")
      end
    end

    context "with an online featured course" do
      let!(:online_featured_course) { FactoryGirl.create(:course, title: "Online", online: true, synopsis: "synopsis", featured: true, venue: nil) }

      scenario do
        course_index_page.visit_page
        expect(course_index_page.featured_course_title).to eq("Online")
        expect(course_index_page.featured_course_synopsis).to eq("synopsis")
        expect(course_index_page.featured_course_meta).to eq("Online")
        expect(course_index_page.featured_course_button).to match("Try now")
      end
    end
  end

  describe "Course list" do
    describe "child courses" do
      let!(:course1) { FactoryGirl.create(:course, title: "Course 1") }
      let!(:course2) { FactoryGirl.create(:course, title: "Course 2") }
      let!(:child_course1) { FactoryGirl.create(:course, parent_course: course1) }
      let!(:child_course2) { FactoryGirl.create(:course, parent_course: course2) }

      scenario do
        course_index_page.visit_page
        expect(course_index_page.course_list_size).to eq(2)
        expect(course_index_page.course_children_size).to eq(2)
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
end