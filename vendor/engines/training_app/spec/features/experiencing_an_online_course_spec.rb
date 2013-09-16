require 'spec_helper'

feature "Experiencing an online course" do
  let(:course) { FactoryGirl.create(:course) }
  let(:registration) { FactoryGirl.create(:registration, course: course, code: "123") }
  let(:show_registration_page) { ShowRegistrationPage.new }

  scenario "with a valid code", js: true do
    show_registration_page.visit_page(registration)
    expect(show_registration_page.title).to match("Introduction")
  end

  scenario "with an invalid code" do
    registration.code = "invalid_code"
    expect(lambda {
      show_registration_page.visit_page(registration)
    }).to raise_error(ActionController::RoutingError, "Not Found")
  end
end