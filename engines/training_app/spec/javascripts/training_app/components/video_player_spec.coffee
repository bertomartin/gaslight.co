describe "VideoPlayerComponent", ->
  beforeEach ->
    @videoPlayer = this.container.lookup("component:video-player")

  describe "src", ->
    beforeEach ->
      Em.run =>
        @videoPlayer.set('src', "test1.mp4")
        @videoPlayer.appendTo(Training.rootElement)
    
    describe "on render", ->
      it "gets set", ->
        expect(@videoPlayer.player.currentSrc()).toEqual('test1.mp4')

    describe "on change", ->
      beforeEach ->
        Em.run =>
          @videoPlayer.set('src', "test2.mp4")

      it "gets updated on the next run loop", ->
        waits 1
        runs => 
          expect(@videoPlayer.player.currentSrc()).toMatch('test2.mp4')
