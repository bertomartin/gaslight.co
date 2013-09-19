describe "Registration", ->
  beforeEach ->
    @registration = new TrainingApp.Models.Registration()
  it "should exist", ->
    expect(@registration).toBeTruthy()
  describe "saving with errors", ->
    beforeEach ->
      @registration.save()
      @request = mostRecentAjaxRequest()
      @errors = {base: ["You've got errors"]}
      @request.response
        status: 422
        responseText: JSON.stringify @errors
    it "adds an errors property on the registration", ->
      expect(@registration.get("errors").base).toEqual(["You've got errors"])
