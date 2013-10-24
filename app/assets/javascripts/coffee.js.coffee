class Gaslight.Views.TaglineView extends Backbone.View

  animation:
    interval: 3000
    duration: 600
    delay: 200

  activeBrand: 1

  constructor: (options) ->
    super
    @$taglines = @$el.children()
    @activate @$taglines.first()
    @$activeTagline.css
      left: 0
    @createTimer()

  createTimer: ->
    intervalCallback = => @transition()
    @timer = setInterval intervalCallback, @animation.interval

  transition: (index) ->
    newTagline = @$taglines.eq index or @getNextIndex()
    @animate @$activeTagline, {left: '100%'}, =>
      @activate newTagline
      @animate newTagline, {left: '0%'}

  animate: (element, options, callback)->
    $(element).stop().delay(@animation.delay).animate options, @animation.duration, @animation.easing, ->
      callback() if callback

  activate: (element)->
    @$taglines.removeClass('active')
    element.addClass('active')
    @$activeTagline = element

  getNextIndex: ->
    activeTaglineIndex = @$taglines.index(@$activeTagline)
    if activeTaglineIndex is @$taglines.length - 1 then 0 else activeTaglineIndex + 1

$ ->
  new Gaslight.Views.TaglineView
    el: '#headings'

