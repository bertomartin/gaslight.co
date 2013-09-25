Training.CourseRoute = Ember.Route.extend
  needs: ['chapter']

  actions:
    toggleSidebar: ->
      @controllerFor('chapter').toggleProperty('isSidebarActive')

    purchase: ->
      @get('controller').purchase()

# Training.CourseIndexRoute = Ember.Route.extend
  # redirect: ->
  #   firstChapter = @get('store').all('chapter').get('firstObject')
  #   @transitionTo('chapter', firstChapter)

