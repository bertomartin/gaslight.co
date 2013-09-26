class ClassroomPage
  include Capybara::DSL

  def visit_page(course, code=nil)
    visit "/training/classroom/?code=#{code}#/courses/#{course.id}"
  end

  def visit_chapter(chapter, code=nil)
    visit "/training/classroom/?code=#{code}#/courses/#{chapter.section.course.id}/chapters/#{chapter.id}"
  end

  def title
    find('.bar__title').text
  end

  def has_chapter?(chapter)
    page.has_content?(chapter.title)
  end

  def disabled_chapters
    find(".subnav__item--disabled") # this will wait until ember renders
    all(".subnav__item--disabled").collect(&:text)
  end

  def code_url
    find('iframe')[:src]
  end

  def showing_purchase_modal?
    has_css?('.modal.modal--active')
  end

  def registration_url
    find('.modal__actions .button')[:href]
  end

  def showing_demo?
    has_css?('.bar__notice--demo')
  end
end

