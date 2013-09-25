Training.Course = DS.Model.extend
  title: DS.attr('string')
  sections: DS.hasMany('section')
