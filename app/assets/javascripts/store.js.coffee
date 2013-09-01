# http://emberjs.com/guides/models/defining-a-store/

Dojo.Store = DS.Store.extend
  revision: 12
  adapter: DS.RESTAdapter.create
    namespace: 'api/v1'

