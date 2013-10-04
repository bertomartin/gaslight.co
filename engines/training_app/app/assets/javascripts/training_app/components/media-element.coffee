Training.MediaElementComponent = Ember.Component.extend
  classNameBindings: ['class']

  playerOptions:
    width: false
    height: false
    controls: true

  didInsertElement: ->
    @createPlayer()

  createPlayer: ->
    @player = videojs('player', @playerOptions)

  loadVideo: ( ->
    @player.pause()
    @player.src(@get('src'))
    @player.load()
  ).observes('src')