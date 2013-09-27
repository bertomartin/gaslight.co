Training.CourseRoute = Ember.Route.extend
  needs: ['chapter']

  afterModel: (model)->
    @controllerFor('application').set('title', model.get('title'))
    @controllerFor('application').setThemeUrl("/training/courses/#{model.get('id')}/theme.css")

  actions:
    toggleSidebar: ->
      @controllerFor('chapters').toggleProperty('isSidebarActive')

    purchase: ->
      @get('controller').purchase()

Training.CourseIndexRoute = Ember.Route.extend
  redirect: ->
    @transitionTo('chapters')