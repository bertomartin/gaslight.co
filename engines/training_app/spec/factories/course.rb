FactoryGirl.define do
  factory :course, class: TrainingApp::Course do
    title "My Awesome Class"
    description_main "A great technology to learn with!"
    start_date { 1.day.ago }
    end_date { Date.today + 1.month }
    price 199
  end
end
