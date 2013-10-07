describe "time", ->
  beforeEach ->
    @view = Ember.View.create
      time: null
      template: Ember.Handlebars.compile("{{time view.time}}")

  describe "less than an hour", ->
    beforeEach ->
      @view.time = 60 * 2
      Ember.run =>
        @view.appendTo(Training.rootElement)
    it "Pretty formats the time", ->
      expect(@view.$().text()).toEqual '(2:00)'

  describe "more than an hour", ->
    beforeEach ->
      @view.time = 60 * 60
      Ember.run =>
        @view.appendTo(Training.rootElement)
    it "Pretty formats the time", ->
      expect(@view.$().text()).toEqual '(1:0:00)'