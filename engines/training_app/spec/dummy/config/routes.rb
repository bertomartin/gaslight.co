Rails.application.routes.draw do
  mount TrainingApp::Engine => "/training"

  mount Jasminerice::Engine => "/training/jasmine"
  get "/jasmine/:suite" => "jasminerice/spec#index"
end
