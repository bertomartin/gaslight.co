Training.SectionsIndexRoute = Ember.Route.extend
  redirect: ->
    @transitionTo('chapter', 1)

Training.SectionsRoute = Ember.Route.extend
  model: ->
    Training.Section.find()