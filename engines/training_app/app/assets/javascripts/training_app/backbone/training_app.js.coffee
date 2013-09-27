#= require training_app/serialize-object
#= require training_app/inflection
#= require training_app/stripe
#= require ./stripe_key
#= require ./namespace
#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require ./views/training_app_view
#= require_tree ./views
#= require_tree ./routers

jQuery.ajaxPrefilter (options, originalOptions, xhr) ->
  xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))

TrainingApp.initialize = (options = {}) ->
  registration = new TrainingApp.Models.Registration(options)
  courseId = registration.get('course').id
  registration.bind "persisted", -> window.location.href = "/training/classroom?code=#{registration.get('code')}#/courses/#{courseId}"
  newRegistrationView = new TrainingApp.Views.NewRegistrationView
    model: registration
    el: $("#new_registration")
  newRegistrationView.render()