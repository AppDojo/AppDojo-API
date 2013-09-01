#= require jquery-1.9.1
#= require handlebars-1.0.0
#= require ember-1.0.0
#= require ember-data
#= require bootstrap
#= require_self
#= require store
#= require router
#= require_tree ./controllers
#= require_tree ./models
#= require_tree ./templates
#= require_tree ./views


window.Dojo = Ember.Application.create
  LOG_TRANSITIONS: true
  LOG_BINDINGS: true
  LOG_ACTIVE_GENERATION: true
  LOG_VIEW_LOOKUPS: true