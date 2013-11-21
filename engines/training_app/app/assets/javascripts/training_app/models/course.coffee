Training.Course = DS.Model.extend
  title: DS.attr('string')
  introduction: DS.attr('string')
  demo: DS.attr('boolean')
  sections: DS.hasMany('section')
