Training.CourseController = Ember.ObjectController.extend
  needs: ['chapter', 'application']
  purchasing: false

  barStyle: (->
    "width: #{@get('controllers.chapter.progress') * 100}%"
  ).property('controllers.chapter.progress')

  registrationLink: (->
    "/training/courses/#{@get('id')}/registrations/new/"
  ).property('id')

  purchase: ->
    @set('purchasing', true)

Training.CourseIndexController = Ember.Controller.extend
  needs: ['course']