#= require training_app/backbone/training_app

TrainingApp.csrf_token = $('meta[name="csrf-token"]').attr('content')

$.ajaxSetup
  beforeSend: (xhr, settings) ->
    return if (settings.crossDomain)
    return if (settings.type == "GET")
    if (TrainingApp.csrf_token)
      xhr.setRequestHeader('X-CSRF-Token', TrainingApp.csrf_token)

$ ->
  $("#detailsLink").click (e) ->
    e.preventDefault()
    $(".details").slideToggle -> $('body').scrollTo($(this), 800)
    _gaq.push(['_trackPageview', "/viewDetail"])
  $("#closeDetails").click (e) ->
    e.preventDefault()
    $(".details").slideUp()

  if $("#new_registration").length > 0
    window.registration = new TrainingApp.Models.Registration
    registration.bind "persisted", -> window.location.href = "/registrations/#{registration.get("code")}"
    window.newRegistrationView = new TrainingApp.Views.NewRegistrationView
      model: registration
      el: $("#new_registration")
    newRegistrationView.render()

  if $('#map').length > 0
    MapOptions =
      zoom: 15,
      center: new google.maps.LatLng(37.767933, -122.393425)
      mapTypeId: google.maps.MapTypeId.ROADMAP
      sensor: false
    map = new google.maps.Map(document.getElementById("map"), MapOptions)

    $("#mapImage").mouseenter -> $("#mapImage").fadeOut()
    $("#map").mouseleave -> $("#mapImage").fadeIn()

  $("button[name = 'button']").click ->
    $("#myModal").reveal()

  # grab clicks inside the accordion
  $('ul.accordion li a.button, ul.accordion li button').on 'click', (e) -> e.stopPropagation()

