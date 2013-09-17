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
end

