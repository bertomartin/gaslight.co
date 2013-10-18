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

$(document).ready ->
  backbone = $(".backbone tbody tr").not(":first-child")
  ember = $(".ember tbody tr").not(":first-child")
  backbone.hide()
  ember.hide()
  $(".toggle_backbone").on "click", ->
    backbone.toggle()
    text = (if $(this).text() is "Show All" then "Close" else "Show All")
    $(this).text(text)
    return

  $(".toggle_ember").on "click", ->
    ember.toggle()
    text = (if $(this).text() is "Show All" then "Close" else "Show All")
    $(this).text(text)
    return
  return


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

