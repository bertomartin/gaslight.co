Training.Store = DS.Store.extend
  revision: 12
  adapter: DS.FixtureAdapter.create()
  # adapter: DS.RESTAdapter.create
  #   namespace: 'api'