require "spec_helper"

module TrainingApp
  describe DateRange do
    describe "to_s" do
      context "no start_date" do
        let(:date_range) { DateRange.new(nil) }
        it "returns nothing" do
          expect(date_range.to_s).to eq("")
        end
      end

      context "no end_date" do
        let(:start_date) { Date.new(2013, 01, 01) }
        let(:date_range) { DateRange.new(start_date) }
        it "only show one date" do
          expect(date_range.to_s).to eq("January 1, 2013")
        end
      end

      context "with the same start_date and end_date" do
        let(:start_date) { Date.new(2013, 01, 01) }
        let(:end_date) { Date.new(2013, 01, 01) }
        let(:date_range) { DateRange.new(start_date, end_date) }
        it "only show one date" do
          expect(date_range.to_s).to eq("January 1, 2013")
        end
      end

      context "with different start_date and end_date" do
        let(:start_date) { Date.new(2013, 01, 01) }
        let(:end_date) { Date.new(2013, 01, 03) }
        let(:date_range) { DateRange.new(start_date, end_date) }
        it "only show one date" do
          expect(date_range.to_s).to eq("January 1 - January 3, 2013")
        end
      end
    end
  end
end