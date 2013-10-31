FactoryGirl.define do
  sequence :title do |n|
    "This is post ##{n}"
  end

  factory :post, class: BlogApp::Post do
    title
    body { "# Heading\n\nThis is the body in markdown." }
    author "authornick"
    published_at Time.now
  end
end
