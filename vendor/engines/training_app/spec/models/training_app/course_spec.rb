require 'spec_helper'

module TrainingApp
  describe Course do

    it { should have_many(:registrations) }

    describe "in_person?" do
      let(:venue) { FactoryGirl.build(:venue)}
      let(:course_with_location) { FactoryGirl.build(:course, start_date: Date.today, venue: nil)}
      let(:course_with_venue) { FactoryGirl.build(:course, start_date: nil, venue: venue)}
      let(:online_course) { FactoryGirl.build(:course, start_date: nil, venue: nil)}

      it "return true for a course with a location" do
        expect(course_with_location.in_person?).to eq(true)
      end

      it "return true for a course with a venue" do
        expect(course_with_venue.in_person?).to eq(true)
      end

      it "return false for a course without a location or a venue" do
        expect(online_course.in_person?).to eq(false)
      end
    end
  end
end

