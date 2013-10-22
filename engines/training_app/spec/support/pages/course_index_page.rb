class CourseIndexPage
  include Capybara::DSL

  def visit_page
    visit "/training/courses"
  end

  def course_titles
    all(".course .course__title").collect(&:text)
  end

  def online_course_titles
    all(".course--online .course__title").collect(&:text)
  end

  def in_person_course_titles
    all(".course--in-person .course__title").collect(&:text)
  end
end

