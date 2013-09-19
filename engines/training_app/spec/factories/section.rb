FactoryGirl.define do
  factory :section, class: TrainingApp::Section do
    title "My Awesome Section"
    course
  end
end
