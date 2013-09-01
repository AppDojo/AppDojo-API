window.Dojo = Ember.Application.create
  pushState: true
  LOG_TRANSITIONS: true
  LOG_BINDINGS: true

Dojo.Store = DS.Store.extend
  revision: 1
  adapter: DS.RESTAdapter.extend
    namespace: 'api/v1'

Dojo.Router.map ->
  @resource('index', {path: '/'})
  @resource('users')
  @resource('about')

Dojo.UsersRoute = Ember.Route.extend
  model: ->
    return Dojo.User.find()

Dojo.Router.reopen
  location: 'history'

Dojo.User = DS.Model.extend
  first_name: DS.attr 'string'
  last_name: DS.attr 'string'
  email: DS.attr 'string'

#Dojo.User.FIXTURES = [
#  id: 1
#  name: "Leo"
#  email: "leo@cloud.com"
#,
#  id: 2
#  name: "Awesome"
#  email: "awesome@cloud.com"
#]

