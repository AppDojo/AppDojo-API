Dojo.ApplicationController = Ember.Controller.extend
  isAbout: (->
    @get('currentRoute') == 'about'
  ).property('currentRoute')

  isUsers: (->
    @get('currentRoute') == 'users'
  ).property('currentRoute')