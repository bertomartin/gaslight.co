class TrainingApp.Views.NewRegistrationView extends TrainingApp.Views.TrainingAppView

  constructor: (options) ->
    super
    @model.bind "error", => @render()

  name: "new_registration"

  events:
    "submit form": "register"

  register: (event) ->
    event.preventDefault()
    @$("input[type=submit]").val("Purchasing...").attr("disabled", "disabled")
    @model.set $(event.target).serializeObject()
    @model.createToken()

  errors: ->
    if @model.get("errors")
      message for field, message of @model.get("errors")
    else
      []

  render: ->
    super
    if @model.get("errors")
      for field, error of @model.get("errors")
        @$("label[for=#{field}]").append("<span class='errors'>(#{error})</span>")
