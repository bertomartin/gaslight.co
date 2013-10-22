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
  $('.top-bar__expand').on 'click', (event)->
    $('.top-bar').toggleClass('top-bar--expanded')

  $('.activate-modal, .modal__backdrop').on 'click touchstart', (event)->
    $('.modal').toggleClass('modal--active')

  $("meta[property='og:article:tag']").each ->
    track('Blog', 'Tag', $(this).attr('content'))

  $("meta[property='author']").each ->
    track('Blog', 'Author', $(this).attr('content'))

  $('audio').each ->
    new MediaElementPlayer this,
      pluginPath: '/assets/'
      audioWidth: '100%'
