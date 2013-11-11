Training.VideoPlayerComponent = Ember.Component.extend
  classNameBindings: [':video-player']

  playerOptions:
    width: false
    height: false
    controls: true
    preload: "auto"
    flash:
      swf: "http://assets1.gaslight.co/javascripts/video-js.swf"

  didInsertElement: ->
    self = this
    videojs('player', @playerOptions).ready ->
      self.player = this

  willDestroyElement: ->
    @player.dispose()

  updateSrc: ->
    return unless this.player?
    @player.currentTime(0)
    @player.pause()
    Ember.run.next =>
      @player.src(@get('src'))
      @player.load()

  srcDidChange: (->
    @updateSrc()
  ).observes('src')