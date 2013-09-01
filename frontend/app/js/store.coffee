Dojo.Store = DS.Store.extend
  revision: 1
  adapter: DS.RESTAdapter.extend
    namespace: 'api/v1'