describe "time helper", ->
  beforeEach ->
    @view = Ember.View.create
      time: null
      template: Ember.Handlebars.compile("{{time view.time}}")

  describe "single digit second", ->
    beforeEach ->
      @view.time = 1
      Ember.run => @view.appendTo(Training.rootElement)
    it "Pretty formats the time", ->
      expect(@view.$().text()).toEqual '0:01'

  describe "single digit minute", ->
    beforeEach ->
      @view.time = 60 * 2
      Ember.run => @view.appendTo(Training.rootElement)
    it "Pretty formats the time", ->
      expect(@view.$().text()).toEqual '2:00'

  describe "double digit minute", ->
    beforeEach ->
      @view.time = 60 * 11
      Ember.run => @view.appendTo(Training.rootElement)
    it "Pretty formats the time", ->
      expect(@view.$().text()).toEqual '11:00'

  describe "single digit hour", ->
    beforeEach ->
      @view.time = 60 * 60
      Ember.run => @view.appendTo(Training.rootElement)
    it "Pretty formats the time", ->
      expect(@view.$().text()).toEqual '1:00:00'

  describe "double digit hour", ->
    beforeEach ->
      @view.time = 60 * 60 * 11
      Ember.run => @view.appendTo(Training.rootElement)
    it "Pretty formats the time", ->
      expect(@view.$().text()).toEqual '11:00:00'