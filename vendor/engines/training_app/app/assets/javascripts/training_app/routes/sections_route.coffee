Training.SectionsRoute = Ember.Route.extend
  model: ->
    @store.find('section')

  actions:
    toggleSidebar: ->
      @controllerFor('chapter').toggleProperty('isSidebarActive')

Training.SectionsIndexRoute = Ember.Route.extend
  redirect: ->
    firstChapter = @get('store').all('chapter').get('firstObject')
    @transitionTo('chapter', firstChapter)
