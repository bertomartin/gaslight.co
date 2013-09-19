Training.MediaElementComponent = Ember.Component.extend
  classNameBindings: ['class']

  playerOptions:
    pluginPath: '/assets/training_app/'
    enableAutosize: false

  didInsertElement: ->
    @createPlayer()

  createPlayer: ->
    # MediaElement pukes if there's no src
    @$('video').attr('src', 'temp.mp4') unless @get('src')?
    @player = new MediaElementPlayer @$('video'), @playerOptions

  onResize: (->
    setTimeout (=> @player.setPlayerSize()), 425
  ).observes('resize')

  loadVideo: ( ->
    @player.setSrc(@get('src'))
    @player.setPoster(@get('poster'))
    @player.load()
  ).observes('src')