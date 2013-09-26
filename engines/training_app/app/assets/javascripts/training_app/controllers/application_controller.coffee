Training.ApplicationController = Ember.Controller.extend
  defaultTitle: "Classroom"

  init: ->
    @setDefaultTitle()

  setDefaultTitle: ->
    @set('title', @get('defaultTitle'))

  titleDidChange: (->
    document.title = @get('title')
  ).observes('title')