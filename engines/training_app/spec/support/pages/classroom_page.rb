class ClassroomPage
  include Capybara::DSL

  def visit_page(course)
    visit "/training/classroom/#/courses/#{course.id}"
  end

  def visit_chapter(chapter)
    visit "/training/classroom/#/courses/#{chapter.section.course.id}/chapters/#{chapter.id}"
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
end

