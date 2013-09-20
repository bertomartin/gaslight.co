require 'spec_helper'

module TrainingApp
  describe Course do

    it { should have_many(:registrations) }

    describe "in_person?" do
      let(:in_person_course) { FactoryGirl.build(:course, online: false)}
      let(:online_course) { FactoryGirl.build(:course, online: true)}

      it "return the inverse of online?" do
        expect(in_person_course.in_person?).to eq(true)
        expect(online_course.in_person?).to eq(false)
      end
    end

    context "with registrations" do
      let(:course) { FactoryGirl.create(:course, capacity: 2) }
      let(:registration) { double('registration') }

      before do
        course.stub(:registrations).and_return(registration)
      end

      describe "#full" do
        it "should return true if registrations are at capacity" do
          registration.stub(:count).and_return(2)
          course.should be_full
        end

        it "should return false if registrations are under capacity" do
          registration.stub(:count).and_return(1)
          course.should_not be_full
        end
      end
    end

    describe "current" do
      let!(:old_course) { FactoryGirl.create(:course, start_date: Date.today - 5.days)}
      let!(:current_course) { FactoryGirl.create(:course, start_date: Date.today + 30.days)}
      it "should return the current course" do
        Course.current.should == current_course
      end
    end

    describe "#dates" do
      let(:course) { FactoryGirl.create(:course) }
      context "in the same month" do
        before do
          course.start_date = Date.new(2012, 7, 1)
          course.end_date = Date.new(2012, 7, 3)
        end
        it "returns a single months dates" do
          expect(course.dates).to eq("July  1 -  3, 2012")
        end
      end

      context "in a different month" do
        before do
          course.start_date = Date.new(2012, 7, 29)
          course.end_date = Date.new(2012, 8, 1)
        end
        it "returns multiple month dates" do
          expect(course.dates).to eq("July 29 - August  1, 2012")
        end
      end
    end

    describe "#price" do
      let(:parent_course) { FactoryGirl.build(:course, price: nil) }
      let(:course) { FactoryGirl.build(:course, price: nil, parent_course: parent_course) }

      context "with a price" do
        before { course.price = 100 }
        it "returns it's price" do
          expect(course.price).to eq(100)
        end
      end

      context "without a price" do
        before { parent_course.price = 200 }
        it "returns it's parents price" do
          expect(course.price).to eq(200)
        end
      end

      context "without a price or a parent price" do
        it "returns nil" do
          expect(course.price).to eq(nil)
        end
      end
    end
    describe "#child_courses, #parent_course" do
      let(:parent_course) { FactoryGirl.create(:course) }
      let(:child_course) { FactoryGirl.create(:course, parent_course: parent_course) }
      it "sets the parent on the child" do
        expect(child_course.parent_course).to eq(parent_course)
      end
      it "sets the child on the parent" do
        expect(parent_course.child_courses).to include(child_course)
      end
    end

    describe ".top_level" do
      let(:parent_course) { FactoryGirl.create(:course) }
      let(:child_course) { FactoryGirl.create(:course, parent_course: parent_course) }
      it "includes the parent_course" do
        expect(Course.top_level).to include(parent_course)
      end
      it "doesn't include the child course" do
        expect(Course.top_level).to_not include(child_course)
      end
    end

    describe "#sibling_courses" do
      let(:parent_course) { FactoryGirl.create(:course) }
      let!(:child_course) { FactoryGirl.create(:course, parent_course: parent_course) }
      let!(:sibling_course1) { FactoryGirl.create(:course, parent_course: parent_course) }
      let!(:sibling_course2) { FactoryGirl.create(:course, parent_course: parent_course) }

      it "returns an empty array if no siblings exist" do
        expect(parent_course.sibling_courses).to eq([])
      end

      it "returns the courses with the same parent" do
        expect(child_course.sibling_courses).to include(sibling_course1, sibling_course2)
      end
    end
  end
end
