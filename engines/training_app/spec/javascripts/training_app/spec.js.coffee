#=require training_app/classroom
#=require_tree ./

$ ->
  $('body').append("<div id='app-container'></div>")

Training.rootElement = '#app-container'
Training.setupForTesting()
Training.injectTestHelpers()

beforeEach ->
  Training.reset()
  this.container = Training.__container__
  this.store = Training.__container__.lookup('store:main')

afterEach ->
  $(Training.rootElement).empty()
