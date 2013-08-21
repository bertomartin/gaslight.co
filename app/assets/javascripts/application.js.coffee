#= require jquery
#= require jquery_ujs
#= require ./analytics
#= require raphael
#= require mediaelement-and-player
#= require underscore
#= require moment
#= require backbone
#= require backbone/gaslight
#= require foundation.min
#= require foundation-orbit

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
  $('#nav .toggle').on 'click touchstart', (event)->
    event.preventDefault()
    track("Mobile Navigation", "Open")
    $('#nav').toggleClass('expanded')

  $("meta[property='og:article:tag']").each ->
    track('Blog', 'Tag', $(this).attr('content'))

  $("meta[property='author']").each ->
    track('Blog', 'Author', $(this).attr('content'))

  $('audio').mediaelementplayer
    pluginPath: '/assets/'
    audioWidth: '100%'

$(window).load ->
  $(".featuredContent").orbit
    directionalNav: 'false'
    advanceSpeed: 8000
