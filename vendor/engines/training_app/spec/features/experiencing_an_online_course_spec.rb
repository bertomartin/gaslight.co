require 'spec_helper'

feature "Experiencing an online course", js: true do
  let(:chapter) { FactoryGirl.create(:chapter, title: "Test Chapter") }
  let(:course) { chapter.section.course }
  let(:registration) { FactoryGirl.create(:registration, course: course, code: "123") }
  let(:show_registration_page) { ShowRegistrationPage.new }

  scenario "with a valid code" do
    show_registration_page.visit_page(registration)
    expect(show_registration_page.title).to match("Test Chapter")
  end

  scenario "with an invalid code", js: false do
    registration.code = "invalid_code"
    expect(lambda {
      show_registration_page.visit_page(registration)
    }).to raise_error(ActionController::RoutingError, "Not Found")
  end

  describe "seeing only this courses chapters" do
    let!(:unrelated_chapter) { FactoryGirl.create(:chapter, title: "Another Chapter") }

    scenario do
      show_registration_page.visit_page(registration)
      expect(show_registration_page).to_not have_chapter(unrelated_chapter)
    end
  end
end