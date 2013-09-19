describe "new_registration_view", ->
  beforeEach ->
    setFixtures "<div id='new_registration_view'></div>"
    @registration = new TrainingApp.Models.Registration
    @newRegistrationView = new TrainingApp.Views.NewRegistrationView
      model: @registration
      first_name: "Eric"
      el: $("#new_registration_view")
    @newRegistrationView.render()
  it "renders the price", ->
    expect(@newRegistrationView.el).toHaveText /\$20/
  describe "with errors", ->
    beforeEach ->
      @registration.set errors: {
        base: ["sorry things went so terrible"]
        name: ["cannot be blank"]
      }
      @newRegistrationView.render()
    it "displays the base error messages", ->
      expect(@newRegistrationView.$(".errors:first")).toHaveText /sorry/
    it "displays the field error messages next to the field", ->
      expect(@newRegistrationView.$("input[name=name]").next()).toHaveText /cannot be blank/

  describe "purchasing", ->
    beforeEach ->
      spyOn(@registration, "createToken")
      @newRegistrationView.render()
      @newRegistrationView.register(new jQuery.Event())
    it "should call create token", ->
      expect(@registration.createToken).toHaveBeenCalled()
    it "should change the purchase button", ->
      expect(@newRegistrationView.$(".accept").val()).toEqual("Purchasing...")
      expect(@newRegistrationView.$(".accept").attr("disabled")).toBeTruthy()
