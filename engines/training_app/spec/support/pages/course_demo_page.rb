class CourseDemoPage
  include Capybara::DSL

  def visit_page(course)
    visit "/training/classroom/#/courses/#{course.id}"
  end

  def disabled_chapters
    find(".subnav__item--disabled") # this will wait until ember renders
    all(".subnav__item--disabled").collect(&:text)
  end
end

