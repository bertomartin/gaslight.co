FactoryGirl.define do
  factory :venue, class: TrainingApp::Venue do
    name "Gaslight Training Room"
    sequence(:address) { |n| "111#{n} Kenwood Rd, Cincinnati OH 4524#{n}" }
    blurb "Such an awesome place to learn"
    city "Cincinnati"
  end
end
