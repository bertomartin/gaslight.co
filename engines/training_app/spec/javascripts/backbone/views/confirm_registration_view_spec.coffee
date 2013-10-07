describe "ConfirmRegistrationView", ->
  beforeEach ->
    setFixtures("<div id='confirm_registration'></div>")
    @workshop = new TrainingApp.Models.Workshop
      id: 1
      price: 695
      early_bird_price: 695
      course: 
        title: "A course"
      venue: 
        name: "Cincinnati"
    @registration = new TrainingApp.Models.Registration(workshop: @workshop)
    @confirmRegistrationView = new TrainingApp.Views.ConfirmRegistrationView(model: @registration, el: $("#confirm_registration"))
    @confirmRegistrationView.render()
  it "renders the workshop, venue, and course details", ->
    expect(@confirmRegistrationView.el).toHaveText /A course/
    expect(@confirmRegistrationView.el).toHaveText /Cincinnati/
    expect(@confirmRegistrationView.el).toHaveText /\$695\.00/