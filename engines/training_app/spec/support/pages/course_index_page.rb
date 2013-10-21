class CourseIndexPage
  include Capybara::DSL

  def visit_page
    visit "/training/courses"
  end

  def course_titles
    all(".course h3").collect(&:text)
  end

  def online_course_titles
    all(".course--online h3").collect(&:text)
  end

  def in_person_course_titles
    all(".course--in-person h3").collect(&:text)
  end
end

