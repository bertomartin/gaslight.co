Training.VideoPlayerComponent = Ember.Component.extend
  classNames: ['video-player']
  classNameBindings: ['isPlaying:video-player--playing:video-player--paused']
  isPlaying: false

  playerOptions:
    width: false
    height: false
    controls: true
    preload: "auto"
    flash:
      swf: "http://assets1.gaslight.co/javascripts/video-js.swf"

  didInsertElement: ->
    @player = videojs('player', @playerOptions)
    @player.on "play", => @set("isPlaying", true)
    @player.on "pause", => @set("isPlaying", false)
    @player.on "ended", => @set("isPlaying", false)

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