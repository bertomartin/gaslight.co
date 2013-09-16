#= require jquery
#= require handlebars
#= require ember
#= require ember-data
#= require training_app/mediaelement
#= require_self
#= require ./store
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./routes
#= require_tree ./components
#= require_tree ./controllers
#= require ./FIXTURES

$.ajaxPrefilter (options, originalOptions, xhr) ->
  xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))

window.Training = Ember.Application.create()