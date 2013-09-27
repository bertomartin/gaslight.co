class CourseIndexPage
  include Capybara::DSL

  def visit_page
    visit "/training/courses"
  end

  def featured_course_title
    first(".featured-card__title").text
  end

  def featured_course_synopsis
    first(".featured-card__synopsis").text
  end

  def featured_course_location
    first(".featured-card__location").text
  end

  def featured_course_meta
    first(".featured-card__meta").text
  end

  def featured_course_button
    first(".featured-card__button").text
  end

  def course_list_size
    all(".course-list__course").size
  end

  def course_children_size
    all(".course__child").size
  end

  def course_titles
    all(".course__heading").collect(&:text)
  end
end

