class TrainingApp.Routers.RegistrationsRouter extends Backbone.Router

  constructor: ->
    super
    @workshop = new TrainingApp.Models.Workshop(workshopJson)
    @registration = new TrainingApp.Models.Registration
      workshop: @workshop
      referral_token: window.referralToken
    @newRegistrationView = new TrainingApp.Views.NewRegistrationView(model: @registration)
    @confirmRegistrationView = new TrainingApp.Views.ConfirmRegistrationView(model: @registration)
    @thankYouView = new TrainingApp.Views.ThankYouView()
    @views = [@newRegistrationView, @confirmRegistrationView, @thankYouView]
    @newRegistrationView.render()
    @registration.bind 'error', => window.router.navigate("/newRegistration", true)
    @registration.bind 'persisted', => window.router.navigate("/thankYou", true)
    $("a.close").bind 'click', => @onClose()
    @bind 'all', @trackPageview

  routes:
    "/newRegistration": "newRegistration"
    "/confirmRegistration": "confirmRegistration"
    "/thankYou": "thankYou"

  trackPageview: ->
    url = Backbone.history.getFragment()
    _gaq.push(['_trackPageview', "#{url}"])
    
  newRegistration: ->
    view.hide() for view in @views
    @newRegistrationView.render()

  confirmRegistration: ->
    view.hide() for view in @views
    @confirmRegistrationView.render()

  thankYou: ->
    view.hide() for view in @views
    @thankYouView.render()
    
  onClose: ->
    window.router.navigate("")
    @newRegistration()
