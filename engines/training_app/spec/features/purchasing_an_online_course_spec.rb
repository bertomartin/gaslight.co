require 'spec_helper'

feature "Purchasing an online course", js: true do
  let(:course) { FactoryGirl.create(:course, online: true) }
  let(:new_registration_page) { NewRegistrationPage.new }
  scenario "submitting the form" do
    new_registration_page.visit_page(course)
    new_registration_page.submit_form("user_params")
    expect(new_registration_page).to be_successful
  end
end