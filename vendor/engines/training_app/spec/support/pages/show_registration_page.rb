class ShowRegistrationPage
  include Capybara::DSL

  def visit_page(registration)
    visit "/training/courses/#{registration.course.id}/registrations/#{registration.code}"
  end

  def title
    find('.bar__title').text
  end
end
