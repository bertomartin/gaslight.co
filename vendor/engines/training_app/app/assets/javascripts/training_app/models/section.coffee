Training.Section = DS.Model.extend
  title: DS.attr('string')
  chapters: DS.hasMany('Training.Chapter')

  allSections: (->
    Training.Section.all()
  ).property()

