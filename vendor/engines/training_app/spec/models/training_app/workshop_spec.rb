require 'spec_helper'

module TrainingApp
  describe Workshop do
    context "with registrations" do
      before do
        @workshop = FactoryGirl.create(:workshop, :capacity => 2)
        @registration = double('registration')
        @workshop.stub(:registrations).and_return(@registration)
      end

      describe "#full" do

        it "should return true if registrations are at capacity" do
          @registration.stub(:count).and_return(2)
          @workshop.should be_full
        end

        it "should return false if registrations are under capacity" do
          @registration.stub(:count).and_return(1)
          @workshop.should_not be_full
        end
      end
      
      describe "current" do
        Given!(:old_workshop) { FactoryGirl.create(:workshop, end_date: Date.today - 5.days)}
        Given!(:current_workshop) { FactoryGirl.create(:workshop, end_date: Date.today + 30.days)}
        Then { Workshop.current.should == current_workshop }
      end
      
    end
    
      describe "dates" do
        
        context "in the same month" do
          Given(:workshop) { FactoryGirl.create(:workshop, start_date: Date.parse("2012-07-01"), end_date: Date.parse("2012-07-03"))}
          Then { workshop.dates.should == "July  1 -  3, 2012"}
        end
        
        context "in the same month" do
          Given(:workshop) { FactoryGirl.create(:workshop, start_date: Date.parse("2012-07-29"), end_date: Date.parse("2012-08-01"))}
          Then { workshop.dates.should == "July 29 - August  1, 2012"}
        end
        
      end

  end
end

