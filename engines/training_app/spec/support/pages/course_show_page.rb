class CourseShowPage
  include Capybara::DSL

  def visit_page(course)
    visit "/training/courses/#{course.id}"
  end

  def has_instructor_name?(name)
    page.has_content?(name)
  end

  def has_instructor_bio?(bio)
    page.has_content?(bio)
  end

  def has_instructor_image?(image_url)
    page.has_css?("img[src$='#{image_url}']")
  end
end

