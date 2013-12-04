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

    describe "#synopsis" do
      let(:parent_course) { FactoryGirl.build(:course, synopsis: "") }
      let(:course) { FactoryGirl.build(:course, synopsis: "", parent_course: parent_course) }

      context "with a synopsis" do
        before { course.synopsis = "test" }
        it "returns it's price" do
          expect(course.synopsis).to eq("test")
        end
      end

      context "without a synopsis" do
        before { parent_course.synopsis = "parent synopsis" }
        it "returns it's parents synopsis" do
          expect(course.synopsis).to eq("parent synopsis")
        end
      end

      context "without a synopsis or a parent synopsis" do
        it "returns nil" do
          expect(course.synopsis).to eq(nil)
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

    describe ".online, .in_person" do
      let(:online_course) { FactoryGirl.create(:course, online: true) }
      let(:in_person_course) { FactoryGirl.create(:course, online: false) }
      it "includes online courses" do
        expect(Course.online).to include(online_course)
        expect(Course.online).to_not include(in_person_course)
      end
      it "includes in_person courses" do
        expect(Course.in_person).to_not include(online_course)
        expect(Course.in_person).to include(in_person_course)
      end
    end

    describe ".active" do
      let(:active_course) { FactoryGirl.create(:course) }
      let(:inactive_course) { FactoryGirl.create(:course, active: false) }
      it "includes the active course" do
        expect(Course.active).to include(active_course)
      end
      it "doesn't include the inactive course" do
        expect(Course.active).to_not include(inactive_course)
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

    describe "#meta" do
      context "online" do
        let(:course) {FactoryGirl.build(:course, online: true)}
        it "returns Online" do
          expect(course.meta).to eq("Online")
        end
      end

      context "in person" do
        let(:venue) {FactoryGirl.build(:venue, city: "Seoul")}
        let(:course) {FactoryGirl.build(:course, online: false, venue: venue, start_date: Date.new(2025, 01, 01))}
        it "returns the date city" do
          expect(course.meta).to eq("January 01, 2025 - Seoul")
        end
      end
    end

    describe ".upcoming" do
      let(:upcoming_course){ FactoryGirl.create(:course, start_date: 1.week.from_now) }
      let(:past_course){ FactoryGirl.create(:course, start_date: 1.week.ago) }
      let(:online_course){ FactoryGirl.create(:course, start_date: nil, online: true) }
      it "returns active upcoming in person courses" do
        expect(Course.upcoming).to include(upcoming_course)
        expect(Course.upcoming).to_not include(past_course)
        expect(Course.upcoming).to_not include(online_course)
      end
    end

    describe ".past" do
      let(:upcoming_course){ FactoryGirl.create(:course, start_date: 1.week.from_now) }
      let(:past_course){ FactoryGirl.create(:course, start_date: 1.week.ago) }
      it "returns active courses" do
        expect(Course.upcoming).to include(upcoming_course)
        expect(Course.upcoming).to_not include(past_course)
      end
    end
  end
end
