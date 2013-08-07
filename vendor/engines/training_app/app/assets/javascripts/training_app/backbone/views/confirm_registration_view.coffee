class TrainingApp.Views.ConfirmRegistrationView extends TrainingApp.Views.TrainingAppView

  name: "confirm_registration"

  events:
    "submit form": "confirm"

  courseTitle: ->
    @model.get("workshop").get("course").title

  startDate: ->
    @model.get("workshop").get("start_date")

  venueName: ->
    @model.get("workshop").get("venue").name

  price: ->
    @model.get("workshop").get("price")
    
  confirm: (event) ->
    event.preventDefault()
    @model.createToken()
