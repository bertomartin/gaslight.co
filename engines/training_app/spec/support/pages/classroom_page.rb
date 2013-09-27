class ClassroomPage
  include Capybara::DSL

  def visit_course(course, code=nil)
    visit "/training/classroom/?code=#{code}#/courses/#{course.id}"
    find('.ember-application') # wait for ember to initialize
  end

  def visit_chapter(chapter, code=nil)
    # Going directly to a restricted chapter will fail unless your go to the course first
    visit_course(chapter.section.course, code)
    visit "/training/classroom/?code=#{code}#/courses/#{chapter.section.course.id}/chapters/#{chapter.id}"
  end

  def title
    find('.info-bar__title').text
  end

  def has_theme_for_course?(course)
    find('.theme-link', visible: false)[:href] == "/training/courses/#{course.id}/theme.css"
  end

  def chapters
    all('.subnav__item')
  end

  def disabled_chapters
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

