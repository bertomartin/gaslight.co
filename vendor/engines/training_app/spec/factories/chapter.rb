FactoryGirl.define do
  factory :chapter, class: TrainingApp::Chapter do
    title "My Awesome Chapter"
    video_url "http://www.quirksmode.org/html5/videos/big_buck_bunny.mp4"
    section
  end
end
