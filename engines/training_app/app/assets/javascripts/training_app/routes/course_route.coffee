Training.CourseRoute = Ember.Route.extend
  needs: ['chapter']

  actions:
    toggleSidebar: ->
      @controller.toggleProperty('isSidebarActive')

    purchase: ->
      @get('controller').purchase()

Training.CourseIndexRoute = Ember.Route.extend
  model: ->
    @controllerFor('course').get('model')