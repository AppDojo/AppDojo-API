# For more information see: http://emberjs.com/guides/routing/

Dojo.Router.reopen
  location: 'history'

Dojo.Router.map ->
  @resource 'users', ->
    @route 'show',
      path: '/:user_id'
    @route 'new'
  @resource 'about'

Dojo.UsersNewRoute = Ember.Route.extend
  model: ->
    return Dojo.User.createRecord()

  events:
    error: (error, transition) ->
      console.log(error.message)

  setupController: (controller, model) ->
    controller.set('content', model)

Dojo.UsersEditRoute = Ember.Route.extend
  model: (params)->
    return Dojo.User.find(params.user_id)

  events:
    error: (error, transition) ->
      console.log(error.message)

  setupController: (controller, model) ->
    controller.set('content', model)
    @controllerFor('application').set('currentRoute', 'users')

Dojo.UsersShowRoute = Ember.Route.extend
  model: (params) ->
    return Dojo.User.find(params.user_id)

  events:
    error: (error, transition) ->
      console.log(error.message)

  setupController: (controller, model) ->
    controller.set('content', model)
    @controllerFor('application').set('currentRoute', 'users')

Dojo.UsersRoute = Ember.Route.extend
  model: ->
    return Dojo.User.find()

  events:
    error: (error, transition) ->
      console.log(error.message)

  setupController: (controller, model) ->
    controller.set('model', model)
    @controllerFor('application').set('currentRoute', 'users')

Dojo.AboutRoute = Ember.Route.extend
  setupController: (controller, model) ->
    @controllerFor('application').set('currentRoute', 'about')
