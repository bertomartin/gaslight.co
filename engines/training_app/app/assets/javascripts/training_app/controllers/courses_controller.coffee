Training.CourseController = Ember.ObjectController.extend
  needs: ['chapter']

  active: (->
    @get('controllers.chapter.isSidebarActive')
  ).property('controllers.chapter.isSidebarActive')

  barStyle: (->
    "width: #{@get('controllers.chapter.progress') * 100}%"
  ).property('controllers.chapter.progress')