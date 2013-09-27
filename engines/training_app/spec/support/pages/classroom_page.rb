class ClassroomPage
  include Capybara::DSL

  def visit_page(course, code=nil)
    visit "/training/classroom/?code=#{code}#/courses/#{course.id}"
  end

  def visit_chapter(chapter, code=nil)
    visit "/training/classroom/?code=#{code}#/courses/#{chapter.section.course.id}/chapters/#{chapter.id}"
  end

  def title
    find('.info-bar__title').text
  end

  def chapters
    find('.nav') # this will wait until ember renders
    all('.subnav__item')
  end

  def disabled_chapters
    find(".nav") # this will wait until ember renders
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

