Training.NavSectionController = Ember.ObjectController.extend
  needs: 'chapter'

  isActive: (->
    @get('controllers.chapter.section') == @get('model')
  ).property('controllers.chapter.model')

  position: (->
    position = @get('currentIndex') + 1
    return "0" + position if position.toString().length <= 1
    position
  ).property('currentIndex')

Training.NavChapterController = Ember.ObjectController.extend
  needs: 'chapter'

  isActive: (->
    @get('controllers.chapter.model') == @get('model')
  ).property('controllers.chapter.model')
