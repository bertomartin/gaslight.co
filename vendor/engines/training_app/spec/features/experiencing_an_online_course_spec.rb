require 'spec_helper'

feature "Experiencing an online course" do
  let(:course) { FactoryGirl.create(:course) }
  let(:registration) { FactoryGirl.create(:registration, course: course, code: "123") }
  let(:show_registration_page) { ShowRegistrationPage.new }

  scenario "with a valid code" do
    show_registration_page.visit_page(registration)
    expect(show_registration_page.title).to eq(course.title)
  end

  scenario "with an invalid code" do
    registration.code = "invalid_code"
    expect(lambda {
      show_registration_page.visit_page(registration)
    }).to raise_error(ActionController::RoutingError, "Not Found")
  end
end