FactoryGirl.define do
  factory :course, class: TrainingApp::Course do
    title "My Awesome Class"
    description_main "A great technology to learn with!"
    active true
    price 199
    introduction "get started with this awesome class"

    factory :online_course do
      online true
    end

    factory :in_person_course do
      start_date { 1.day.from_now }
      end_date { 1.day.from_now }
    end
  end
end
