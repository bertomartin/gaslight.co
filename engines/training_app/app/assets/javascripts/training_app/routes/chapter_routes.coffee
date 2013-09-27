Training.ChapterRoute = Ember.Route.extend
  afterModel: (model, transition) ->
    if model.get('isRestricted')
      @send('purchase')
      transition.abort()
    @controllerFor('application').set('title', "#{model.get('section.title')} - #{model.get('title')}")
