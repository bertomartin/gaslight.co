Training.Section = DS.Model.extend
  title: DS.attr('string')
  course: DS.belongsTo('course')
  chapters: DS.hasMany('chapter')

  allSections: (->
    @get('store').all('section')
  ).property()

  currentIndex: (->
    @get('allSections').indexOf(this)
  ).property('allSections.@each')
