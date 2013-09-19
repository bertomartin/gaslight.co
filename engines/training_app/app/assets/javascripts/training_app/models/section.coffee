Training.Section = DS.Model.extend
  title: DS.attr('string')
  chapters: DS.hasMany('chapter')

  allSections: (->
    @get('store').all('section')
  ).property()

