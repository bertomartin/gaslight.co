Training.VideoPlayerComponent = Ember.Component.extend
  classNameBindings: ['class']

  playerOptions:
    width: false
    height: false
    controls: true
    preload: "auto"

  didInsertElement: ->
    @createPlayer()

  createPlayer: ->
    @player = videojs('player', @playerOptions)

  loadVideo: ( ->
    @player.pause()
    @player.src(@get('src'))
    @player.load()
  ).observes('src')