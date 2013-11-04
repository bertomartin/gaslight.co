describe "markdown", ->
  beforeEach ->
    @view = Ember.View.create
      description: null
      template: Ember.Handlebars.compile("{{markdown view.description}}")

  describe "less than an hour", ->
    beforeEach ->
      @view.description = "## Description"
      Ember.run =>
        @view.appendTo(Training.rootElement)
    it "Pretty formats the time", ->
      expect(@view.$('h2').text()).toEqual 'Description'