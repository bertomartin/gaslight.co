require 'spec_helper'

feature "Demoing a course", js: true do
  let!(:course) { FactoryGirl.create(:course, online: true) }
  let!(:section) { FactoryGirl.create(:section, course: course) }
  let!(:demo_chapter) { FactoryGirl.create(:chapter, title: "Demo Chapter", demo: true, section: section) }
  let!(:restricted_chapter) { FactoryGirl.create(:chapter, title: "Restricted Chapter", section: section) }
  let(:course_demo_page) { CourseDemoPage.new }
  scenario "with restricted and demo chapters" do
    course_demo_page.visit_page(course)
    expect(course_demo_page.disabled_chapters).to include(restricted_chapter.title)
    expect(course_demo_page.disabled_chapters).to_not include(demo_chapter.title)
  end
end