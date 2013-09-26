require 'spec_helper'

feature "Experiencing an online course", js: true do
  let(:chapter) { FactoryGirl.create(:chapter, title: "Test Chapter") }
  let(:course) { chapter.section.course }
  let(:registration) { FactoryGirl.create(:registration, course: course, code: "123") }
  let(:classroom_page) { ClassroomPage.new }

  scenario "with a valid code" do
    classroom_page.visit_page(registration.course, registration.code)
    expect(classroom_page.title).to eq(registration.course.title)
  end

  scenario "with an invalid code" do
    registration.code = "invalid_code"
    classroom_page.visit_page(registration.course, registration.code)
    expect(classroom_page).to be_demo
  end

  # TODO - this is a slow test because it waits for capybara to time out
  describe "seeing only this courses chapters" do
    let!(:unrelated_chapter) { FactoryGirl.create(:chapter, title: "Another Chapter") }

    scenario do
      classroom_page.visit_page(registration.course, registration.code)
      expect(classroom_page).to_not have_chapter(unrelated_chapter)
    end
  end
end