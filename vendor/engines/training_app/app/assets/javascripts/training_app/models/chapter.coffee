Training.Chapter = DS.Model.extend
  title: DS.attr('string')
  order: DS.attr('string')
  description: DS.attr('string')
  videoUrl: DS.attr('string')
  codeUrl: DS.attr('string')
  repoUrl: DS.attr('string')
  posterUrl: DS.attr('string')
  section: DS.belongsTo('Training.Section')

  allChapters: (->
    Training.Chapter.all()
  ).property()

  nextChapter: (->
    @get('allChapters').objectAt(@get('currentIndex') + 1)
  ).property('currentIndex')

  previousChapter: (->
    @get('allChapters').objectAt(@get('currentIndex') - 1)
  ).property('currentIndex')

  progress: (->
    (@get('currentIndex') + 1) / @get('allChapters.length')
  ).property('currentIndex')

  currentIndex: (->
    @get('allChapters').indexOf(this)
  ).property('allChapters.@each')