require 'spec_helper'

feature "Demoing a course", js: true do
  let(:classroom_page) { ClassroomPage.new }

  let!(:course) { FactoryGirl.create(:course, online: true) }
  let!(:section) { FactoryGirl.create(:section, course: course) }
  let!(:demo_chapter) { FactoryGirl.create(:chapter, title: "Demo", section: section, demo: true, code_url: "http://test.com") }
  let!(:restricted_chapter) { FactoryGirl.create(:chapter, title: "Restricted", section: section) }

  describe "restricted nav links" do
    scenario "should be disabled" do
      classroom_page.visit_page(course)
      expect(classroom_page.disabled_chapters).to include(restricted_chapter.title)
      expect(classroom_page.disabled_chapters).to_not include(demo_chapter.title)
    end
  end
end