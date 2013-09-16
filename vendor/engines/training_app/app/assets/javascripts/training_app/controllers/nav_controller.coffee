Training.NavSectionController = Ember.ObjectController.extend
  needs: 'chapter'

  isActive: (->
    @get('controllers.chapter.section') == @get('model')
  ).property('controllers.chapter.model')

  number: (->
    return "0" + @get('id') if @get('id').toString().length <= 1
    @get('id')
  ).property('id')


Training.NavChapterController = Ember.ObjectController.extend
  needs: 'chapter'

  isActive: (->
    @get('controllers.chapter.model') == @get('model')
  ).property('controllers.chapter.model')
