Training.CourseRoute = Ember.Route.extend
  needs: ['chapter']

  afterModel: (model)->
    @controllerFor('application').set('title', model.get('title'))

  actions:
    toggleSidebar: ->
      @controllerFor('chapters').toggleProperty('isSidebarActive')

    purchase: ->
      @get('controller').purchase()

Training.CourseIndexRoute = Ember.Route.extend
  redirect: ->
    @transitionTo('chapters')