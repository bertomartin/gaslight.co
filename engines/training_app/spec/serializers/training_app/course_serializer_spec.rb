require 'spec_helper'

module TrainingApp
  describe CourseSerializer do
    let(:course) { FactoryGirl.create(:course)}
    let(:registration) { FactoryGirl.create(:registration, course: course) }

    context "with a registration" do
      let(:serializer){ CourseSerializer.new(course, scope: registration, scope_name: "registration") }
      it "should not have a demo attribute" do
        expect(serializer.attributes[:demo]).to_not be_present
      end
    end

    context "without a registration" do
      let(:serializer){ CourseSerializer.new(course, scope: nil, scope_name: "registration") }
      it "should have a demo attribute set to true" do
        expect(serializer.attributes[:demo]).to eq(true)
      end
    end
  end
end