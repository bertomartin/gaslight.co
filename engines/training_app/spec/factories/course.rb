FactoryGirl.define do
  factory :course, class: TrainingApp::Course do
    title "My Awesome Class"
    description_main "A great technology to learn with!"
    description_close "Why not try it?"
    start_date { 1.day.ago }
    end_date { Date.today + 1.month }
    price 199
    featured false
  end
end
