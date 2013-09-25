Training.ChapterRoute = Ember.Route.extend
  afterModel: (model, transition) ->
    if model.get('isDisabled')
      transition.abort()
      alert("bro, you need to purchase")
    @controllerFor('application').set('title', model.get('title'))

Training.ChaptersIndexRoute = Ember.Route.extend
  redirect: ->
    firstChapter = @get('store').all('chapter').get('firstObject')
    @transitionTo('chapter', firstChapter)

