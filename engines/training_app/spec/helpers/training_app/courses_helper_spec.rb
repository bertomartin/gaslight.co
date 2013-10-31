require "spec_helper"

describe TrainingApp::CoursesHelper do
  describe "#markdown" do
    let(:text) { "## Some Text" }
    it "renders text to markdown" do
      expect(helper.markdown(text)).to eq("<h2>Some Text</h2>\n")
    end
  end
end
