require 'spec_helper'

feature "Experiencing an online course", js: true do
  let(:course) { FactoryGirl.create(:course, title: "Test Course") }
  let(:registration) { FactoryGirl.create(:registration, course: course, code: "123") }
  let(:classroom_page) { ClassroomPage.new }

  describe "viewing a course" do
    context "with a valid code" do
      scenario "isn't in demo mode" do
        classroom_page.visit_course(course, registration.code)
        expect(classroom_page.title).to eq("#{course.title}")
      end
    end

    context "with an invalid code" do
      scenario "is in demo mode" do
        classroom_page.visit_course(course, "invalid_code")
        expect(classroom_page).to be_showing_demo
      end
    end
  end

  describe "sidebar navigation" do
    let(:section) { FactoryGirl.create(:section, course: course) }

    describe "unrelated chapters" do
      let!(:chapter) { FactoryGirl.create(:chapter, title: "Test Chapter", section: section) }
      let!(:unrelated_chapter) { FactoryGirl.create(:chapter, title: "Another Chapter") }

      scenario "should not be visible" do
        classroom_page.visit_course(course, registration.code)
        expect(classroom_page.chapters).to eq(["Test Chapter"])
      end
    end

    describe "chapter ordering" do
      let!(:chapter3) { FactoryGirl.create(:chapter, title: "Three", sort_order: nil, section: section) }
      let!(:chapter2) { FactoryGirl.create(:chapter, title: "Two", sort_order: 2, section: section) }
      let!(:chapter1) { FactoryGirl.create(:chapter, title: "One", sort_order: 1, section: section) }
      scenario "should be ordered by the order property" do
        classroom_page.visit_course(course, registration.code)
        expect(classroom_page.chapters).to eq(["One", "Two", "Three"])
      end
    end
  end
end