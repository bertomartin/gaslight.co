#=require training_app/classroom
#=require_tree ./

$ ->
  $('body').append("<div id='app-container'></div>")

Training.rootElement = '#app-container'
Training.setupForTesting()
Training.injectTestHelpers()

beforeEach ->
  Training.reset()

afterEach ->
  $(Training.rootElement).empty()
