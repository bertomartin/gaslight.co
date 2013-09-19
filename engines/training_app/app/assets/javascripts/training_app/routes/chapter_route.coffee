Training.ChapterRoute = Ember.Route.extend
  afterModel: (model) ->
    @controllerFor('application').set('title', model.get('title'))
