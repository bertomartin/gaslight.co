Training.VideoPlayerComponent = Ember.Component.extend
  classNameBindings: [':video-player']

  playerOptions:
    width: false
    height: false
    controls: true
    preload: "auto"
    flash:
      swf: "/assets/training_app/video-js.swf"

  didInsertElement: ->
    @createPlayer()

  willDestroy: ->
    @player.dispose()

  createPlayer: ->
    @player = videojs('player', @playerOptions)

  loadVideo: ( ->
    @player.pause()
    @player.src(@get('src'))
    @player.load()
  ).observes('src')