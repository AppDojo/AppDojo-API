Dojo.UsersEditController = Ember.ObjectController.extend
  destroy: ->
    @content.deleteRecord()
    @store.commit()
    @transitionTo('users.index')

  save: ->
    @content.save().then =>
      @transitionTo('users.show', @content)

  cancel: ->
    if @content.isDirty
      @content.rollback()
    @transitionTo('users.show', @content)

  buttonTitle: 'Edit'
  headerTitle: 'Edit'