Training.Chapter = DS.Model.extend
  title: DS.attr('string')
  order: DS.attr('string')
  description: DS.attr('string')
  duration: DS.attr('number')
  videoUrl: DS.attr('string')
  codeUrl: DS.attr('string')
  repoUrl: DS.attr('string')
  posterUrl: DS.attr('string')
  demo: DS.attr('boolean')
  section: DS.belongsTo('section')

  allChapters: (->
    @get('store').all('chapter')
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

  isRestricted: (->
    @get('section.course.demo') && !@get('demo')
  ).property('section.course.demo', 'demo')

  currentIndex: (->
    @get('allChapters').indexOf(this)
  ).property('allChapters.@each')