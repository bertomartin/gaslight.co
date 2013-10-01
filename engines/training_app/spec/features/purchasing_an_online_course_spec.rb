require 'spec_helper'

feature "Purchasing an online course", js: true do
  # increase the capybara wait time to account for stripe
  let(:capybara_origional_wait_time) { Capybara.default_wait_time }
  before { Capybara.default_wait_time = 10 }
  after { Capybara.default_wait_time = capybara_origional_wait_time }

  let(:course) { FactoryGirl.create(:course, online: true) }
  let(:new_registration_page) { NewRegistrationPage.new }
  scenario "submitting the form" do
    new_registration_page.visit_page(course)
    new_registration_page.submit_form("user_params")
    expect(new_registration_page).to be_successful
  end
end