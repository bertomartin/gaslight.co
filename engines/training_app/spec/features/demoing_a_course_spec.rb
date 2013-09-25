require 'spec_helper'

feature "Demoing a course", js: true do
  let(:classroom_page) { ClassroomPage.new }

  let!(:course) { FactoryGirl.create(:course, online: true) }
  let!(:section) { FactoryGirl.create(:section, course: course) }

  describe "viewing restricted nav links" do
    let!(:demo_chapter) { FactoryGirl.create(:chapter, title: "Demo", demo: true, section: section) }
    let!(:restricted_chapter) { FactoryGirl.create(:chapter, title: "Restricted", section: section) }

    scenario "should be disabled" do
      classroom_page.visit_page(course)
      expect(classroom_page.disabled_chapters).to include(restricted_chapter.title)
      expect(classroom_page.disabled_chapters).to_not include(demo_chapter.title)
    end
  end


  describe "viewing a chapter" do
    let!(:demo_chapter) { FactoryGirl.create(:chapter, title: "Demo", demo: true, code_url: "http://test.com/") }
    scenario "should exist" do
      classroom_page.visit_chapter(demo_chapter)
      expect(classroom_page.code_url).to eq("http://test.com/")
    end
  end
end