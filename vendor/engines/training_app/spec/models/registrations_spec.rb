require 'spec_helper'

describe Registration do

  describe "creating a registration without a workshop" do
    before do
      Registration.any_instance.stub(:charge_stripe).and_return(true)
      @registration = FactoryGirl.create(:registration, workshop: nil)
    end
    it "should be able to create one" do
      @registration.should be_valid
    end
    it "should generate a unique customer code" do
      @registration.code.should_not be_nil
    end

  end

  describe "capacity validation on create" do
    before do
      @workshop = FactoryGirl.create(:workshop, :capacity => 1)
      Registration.any_instance.stub(:charge_stripe).and_return(true)
    end

    it "should allow registrations if workshop isn't full" do
      registration = FactoryGirl.build(:registration, :workshop => @workshop)
      registration.should be_valid
    end

    describe "full workshop" do
      before do
        FactoryGirl.create(:registration, :workshop => @workshop)
        @new_registration = FactoryGirl.build(:registration, :workshop => @workshop)
      end

      it "should not allow registration if workshop is full" do
        @new_registration.should_not be_valid
      end
    end
  end

  describe "bypassing purchase" do
    subject { FactoryGirl.create(:registration, workshop: nil, freebie: true) }

    it { should be_valid }
    it { should have(0).errors }
    it { should_not be_new_record }
  end
end
