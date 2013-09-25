Training.CourseController = Ember.ObjectController.extend
  needs: ['chapter']
  purchasing: false

  active: (->
    @get('controllers.chapter.isSidebarActive')
  ).property('controllers.chapter.isSidebarActive')

  barStyle: (->
    "width: #{@get('controllers.chapter.progress') * 100}%"
  ).property('controllers.chapter.progress')

  purchase: ->
    @set('purchasing', true)