Training.ApplicationRoute = Ember.Route.extend
  events:
    willTransition: ->
      @controllerFor('application').setDefaultTitle()