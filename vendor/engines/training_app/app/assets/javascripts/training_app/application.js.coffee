#= require training_app/backbone/training_app

TrainingApp.csrf_token = $('meta[name="csrf-token"]').attr('content')

$.ajaxSetup
  beforeSend: (xhr, settings) ->
    return if (settings.crossDomain)
    return if (settings.type == "GET")
    if (TrainingApp.csrf_token)
      xhr.setRequestHeader('X-CSRF-Token', TrainingApp.csrf_token)

TrainingApp.initialize = (options = {}) ->
  registration = new TrainingApp.Models.Registration(options)
  registration.bind "persisted", -> window.location.href = "/registrations/#{registration.get("code")}"
  newRegistrationView = new TrainingApp.Views.NewRegistrationView
    model: registration
    el: $("#new_registration")
  newRegistrationView.render()