Dojo.Router.reopen
  location: 'history'

Dojo.Router.map ->
  @resource 'users'
  @resource 'about'

Dojo.UsersRoute = Ember.Route.extend
  model: ->
    return Dojo.User.find()

