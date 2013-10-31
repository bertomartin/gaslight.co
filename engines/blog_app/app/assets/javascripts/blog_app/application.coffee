#= require jquery
#= require underscore
#= require backbone
#= require blog_app/mediaelement-and-player
#= require ./namespace
#= require_tree ./templates
#= require_tree ./views

$ ->
  $('audio').each ->
    new MediaElementPlayer this,
      pluginPath: '/assets/blog_app'
      audioWidth: '100%'