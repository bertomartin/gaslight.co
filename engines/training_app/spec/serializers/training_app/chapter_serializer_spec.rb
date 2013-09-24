require 'spec_helper'

module TrainingApp
  describe ChapterSerializer do
    context "with a registration" do
      let(:registration) { FactoryGirl.create(:registration) }
      let(:chapter) { FactoryGirl.create(:chapter, video_url: "test", code_url: "jsbin.com")}
      let(:serializer){ ChapterSerializer.new(chapter, scope: registration, scope_name: "registration") }
      it "should include urls" do
        expect(serializer.attributes[:video_url]).to be_present
      end
    end

    context "without a registration" do
      let(:chapter) { FactoryGirl.create(:chapter, video_url: "test", code_url: "jsbin.com")}
      let(:serializer){ ChapterSerializer.new(chapter, scope: nil, scope_name: "registration") }
      it "should remove urls" do
        expect(serializer.attributes[:video_url]).to be_blank
      end

    end
  end
end