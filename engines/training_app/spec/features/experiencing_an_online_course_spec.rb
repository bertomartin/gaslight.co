require 'spec_helper'

feature "Experiencing an online course", js: true do
  let(:chapter) { FactoryGirl.create(:chapter, title: "Test Chapter") }
  let(:course) { chapter.section.course }
  let(:registration) { FactoryGirl.create(:registration, course: course, code: "123") }
  let(:classroom_page) { ClassroomPage.new }

  scenario "with a valid code" do
    classroom_page.visit_course(registration.course, registration.code)
    expect(classroom_page.title).to eq("#{chapter.section.title} - #{chapter.title}")
  end

  scenario "with an invalid code" do
    registration.code = "invalid_code"
    classroom_page.visit_course(registration.course, registration.code)
    expect(classroom_page).to be_showing_demo
  end

  describe "seeing only this courses chapters" do
    let!(:unrelated_chapter) { FactoryGirl.create(:chapter, title: "Another Chapter") }

    scenario "should not see the unrelated chapter" do
      classroom_page.visit_course(registration.course, registration.code)
      expect(classroom_page.chapters.count).to eq(1)
    end
  end
end