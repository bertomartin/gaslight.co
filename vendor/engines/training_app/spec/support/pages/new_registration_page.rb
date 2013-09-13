class NewRegistrationPage
  include Capybara::DSL

  def visit_page(course)
    visit "/training/courses/#{course.id}/registrations/new"
  end

  def submit_form(user)
    fill_in "name", with: "Bob Jones"
    fill_in "email", with: "bobjones@example.com"
    fill_in "Name on Card", with: "Bob Jones"
    fill_in "Card Number", with: "4242424242424242"
    fill_in "Expiration Month (MM)", with: "04"
    fill_in "Expiration Year (YYYY)", with: "2015"
    fill_in "CVC", with: "222"
    click_button "Purchase"
  end

  def successful?
    page.has_content?("Im so proud of you")
  end
end

