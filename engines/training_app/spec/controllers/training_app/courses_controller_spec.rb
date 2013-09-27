require 'spec_helper'

module TrainingApp
  describe CoursesController do
    render_views
    let(:course) {FactoryGirl.create(:course, color_primary: "red", color_secondary: "blue")}
    describe "GET theme.css" do
      it "renders the theme" do
        get :theme, id: course.id, format: :css, use_route: :training
        expect(response.body).to match('color: red')
      end
    end
  end
end