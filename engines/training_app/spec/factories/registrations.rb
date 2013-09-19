FactoryGirl.define do
  factory :registration, class: TrainingApp::Registration do
    name "Joe Mama"
    email "joemama@example.com"
    course
  end
end
