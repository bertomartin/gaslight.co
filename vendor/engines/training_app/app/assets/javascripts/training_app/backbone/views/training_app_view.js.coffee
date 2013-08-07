class TrainingApp.Views.TrainingAppView extends Backbone.View

  name: "new_registration"

  constructor: (options = {})->
    @el = $("##{@name}-view") unless options.el
    super

  render: ->
    @$el.html JST["training_app/backbone/templates/#{@name}_template"](@)
    @$el.show()


  get: (attr)->
    @model.get(attr)

  hide: ->
    @el.hide()
  
