Training.ApplicationController = Ember.Controller.extend
  defaultTitle: "Ember.js"

  init: ->
    @setDefaultTitle()

  setDefaultTitle: ->
    @set('title', @get('defaultTitle'))

  titleDidChange: (->
    document.title = @get('title')
  ).observes('title')