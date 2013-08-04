# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :workshop do
    venue
    course
    price 1
    start_date "2012-02-25"
    end_date "2012-02-25"
    capacity 1
    early_bird_price 1
    early_bird_end_date "2012-02-25 08:00:11"
  end
end
