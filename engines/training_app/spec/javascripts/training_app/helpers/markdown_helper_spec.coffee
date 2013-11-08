describe "markdown helper", ->
  beforeEach ->
    @view = Ember.View.create
      description: "## Description"
      template: Ember.Handlebars.compile("{{markdown view.description}}")
    Ember.run =>
      @view.appendTo(Training.rootElement)

  it "to html", ->
    expect(@view.$('h2').text()).toEqual 'Description'