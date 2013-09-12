# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :instructor, class: TrainingApp::Instructor do
    name "Lester"
    bio "The coolest brony on earth"
    image_url "lester.png"
  end
end
