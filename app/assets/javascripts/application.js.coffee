#= require jquery
#= require jquery_ujs
#= require ./analytics
#= require raphael
#= require mediaelement-and-player
#= require underscore
#= require moment
#= require backbone
#= require backbone/gaslight
#= require training_app/registrations

track = (category, action, value = "") ->
  _gaq.push(['_trackEvent', category, action, value])

$ ->
  $('.top-bar__expand').on 'click touchstart', (event)->
    $('.top-bar').toggleClass('top-bar--expanded')

  $("meta[property='og:article:tag']").each ->
    track('Blog', 'Tag', $(this).attr('content'))

  $("meta[property='author']").each ->
    track('Blog', 'Author', $(this).attr('content'))

  $('audio').each ->
    new MediaElementPlayer this,
      pluginPath: '/assets/'
      audioWidth: '100%'
