describe "NavSectionController", ->
  beforeEach ->
    Em.run =>
      @section = this.store.createRecord('Section', title: "Test Section")
      @chapter = this.store.createRecord('Chapter', title: "Test Chapter", section: @section)
      @navSectionController = this.container.lookup("controller:navSection")
      @chapterController = this.container.lookup("controller:chapter")
      @navSectionController.set('model', @section)
      @chapterController.set('model', @chapter)

  describe "currentChapterPostion", ->
    describe "with the current chapter in this section", ->
      beforeEach ->
        Em.run =>
          @chapterController.set('model', @chapter)
      it "is 1", ->
        expect(@navSectionController.get('currentChapterPosition')).toEqual(1)

    describe "with the current chapter not in this section", ->
      beforeEach ->
        Em.run =>
          @chapterController.set('model', null)
      it "is 0", ->
        expect(@navSectionController.get('currentChapterPosition')).toEqual(0)

    describe "with multiple chapters in this section", ->
      beforeEach ->
        Em.run =>
          @chapter2 = this.store.createRecord('Chapter', title: "Test Chapter2", section: @section)
          @chapterController.set('model', @chapter2)
      it "is 2", ->
        expect(@navSectionController.get('currentChapterPosition')).toEqual(2)