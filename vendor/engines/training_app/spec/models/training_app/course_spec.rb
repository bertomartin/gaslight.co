require 'spec_helper'

module TrainingApp
  describe Course do

    it { should have_many(:registrations) }

    describe "in_person?" do
      let(:workshop) { FactoryGirl.build(:workshop)}
      let(:course_with_start_date) { FactoryGirl.build(:course, start_date: Date.today, workshops: [])}
      let(:course_with_workshop) { FactoryGirl.build(:course, start_date: nil, workshops: [workshop])}
      let(:online_course) { FactoryGirl.build(:course, start_date: nil, workshops: [])}

      it "return true for a course with a location" do
        expect(course_with_start_date.in_person?).to eq(true)
      end

      it "return true for a course with a workshop" do
        expect(course_with_workshop.in_person?).to eq(true)
      end

      it "return false for a course without a location or a venue" do
        expect(online_course.in_person?).to eq(false)
      end
    end
  end
end

