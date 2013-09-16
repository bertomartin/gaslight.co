class TrainingApp.Models.Registration extends Backbone.Model
  urlRoot: ->
    "/training/courses/#{@get('course_id')}/registrations"

  idAttribute: "code"

  defaults:
    amount: 10

  createToken: ->
    cardAttrs =
      number: @get 'cardNumber'
      cvc: @get 'cardCvc'
      exp_month: @get 'cardExpirationMonth'
      exp_year: @get 'cardExpirationYear'
      name: @get 'cardName'
    Stripe.createToken cardAttrs, Number(@get('amount')) * 100, (status, response) => @handleStripeResponse(status, response)

  handleStripeResponse: (status, response) ->
    if response.error
      @set errors:
        base: response.error.message
      @trigger("error")
    else
      @set stripeToken: response.id
      @save()

  toJSON: ->
    json = {}
    for attribute of @attributes
      unless attribute.match(/^card/) or attribute == "workshop"
        json[attribute.tableize().singularize()] = @attributes[attribute]
    json

  save: (args, options)->
    options or= {}
    success = options.success
    options.success = (model,response)=>
      @trigger("persisted")
      success(model, response) if success
    error = options.error
    options.error = (model, response)=>
      errors = JSON.parse response.responseText
      @set errors: errors
      @trigger("error")
    super(args, options)

class TrainingApp.Collections.RegistrationsCollection extends Backbone.Collection
  model: TrainingApp.Models.Registration
  url: '/registrations'
