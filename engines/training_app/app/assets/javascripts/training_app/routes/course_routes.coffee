Training.CourseRoute = Ember.Route.extend
  afterModel: (model)->
    @controllerFor('application').set('title', model.get('title'))
    @controllerFor('application').setThemeUrl("/training/courses/#{model.get('id')}/theme.css")

  actions:
    purchase: ->
      @get('controller').purchase()

Training.CourseIndexRoute = Ember.Route.extend
  redirect: ->
    @replaceWith('chapters.index')