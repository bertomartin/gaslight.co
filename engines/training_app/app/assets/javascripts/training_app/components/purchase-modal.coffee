Training.PurchaseModalComponent = Ember.Component.extend
  classNames: "modal"
  classNameBindings: ['active:modal--active']
  actions:
    deactivate: ->
      @set('active', false)

  purchaseUrl: (->
    "/training/courses/#{@get('course.id')}/registrations/new"
  ).property('course.id')
