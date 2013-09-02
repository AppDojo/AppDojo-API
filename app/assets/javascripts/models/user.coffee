Dojo.User = DS.Model.extend
  firstName: DS.attr 'string', defaultValue: ''
  lastName: DS.attr 'string', defaultValue: ''
  email: DS.attr 'string'
  password: DS.attr 'string'
  passwordConfirmation: DS.attr 'string'
  fullName: (->
    "#{@get('firstName')} #{@get('lastName')}"
  ).property('firstName', 'lastName')

  becameError: ->
    # handle error case here
    alert 'there was an error!'

  becameInvalid: (errors) ->
    # record was invalid
    alert "Record was invalid because: #{errors}"