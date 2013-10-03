#= require jquery
#= require handlebars
#= require ember
#= require ember-data
#= require training_app/video-js
#= require training_app/moment
#= require_self
#= require ./store
#= require_tree ./helpers
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./routes
#= require_tree ./components
#= require_tree ./controllers

$.ajaxSetup(data: code: window.registrationCode)

$.ajaxPrefilter (options, originalOptions, xhr) ->
  xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))

Ember.LOG_VERSION = false

window.Training = Ember.Application.create()