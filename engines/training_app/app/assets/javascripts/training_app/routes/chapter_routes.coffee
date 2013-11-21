Training.ChaptersRoute = Ember.Route.extend
  actions:
    toggleSidebar: ->
      @controller.toggleProperty('isSidebarActive')

Training.ChaptersIndexRoute = Ember.Route.extend
  needs: ['course']

Training.ChapterRoute = Ember.Route.extend
  afterModel: (model, transition) ->
    if model.get('isRestricted')
      @send('purchase')
      return transition.abort()
    @controllerFor('application').set('title', "#{model.get('section.title')} - #{model.get('title')}")
