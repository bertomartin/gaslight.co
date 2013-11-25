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
    @setupFlashPlayer() if @player.techName == "Flash"

  setupFlashPlayer: ->
    # need to set static size when using flash player
    width = @$().width()
    @player.width(width)
    @player.height(width * (9/16))

  willDestroyElement: ->
    @player.dispose()

  updateSrc: ->
    @player.src(@get('src')) if @get('src')?
    @player.poster(@get('poster')) if @get('poster')?

  srcDidChange: (->
    return unless this.player?
    @player.currentTime(0)
    @player.pause()
    Ember.run.next => @updateSrc()
  ).observes('src')