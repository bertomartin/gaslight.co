Training.CourseController = Ember.ObjectController.extend
  needs: ['chapter']
  purchasing: false
  isSidebarActive: false

  barStyle: (->
    "width: #{@get('controllers.chapter.progress') * 100}%"
  ).property('controllers.chapter.progress')

  purchase: ->
    @set('purchasing', true)