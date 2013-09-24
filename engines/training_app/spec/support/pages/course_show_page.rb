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

  def has_registration_link?(url)
    page.has_css?("a[href$='#{url}']")
  end

  def buy_now_link
    page.find(".purchase-panel__buy")["href"]
  end

  def price
    page.find(".purchase-panel__price").text
  end

  def description_html
    page.find(".course__description").native.inner_html
  end
end

