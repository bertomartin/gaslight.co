Training.ApplicationRoute = Ember.Route.extend
  actions:
    willTransition: ->
      @controllerFor('application').setDefaultTitle()