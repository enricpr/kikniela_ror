App.RegistrationController = Ember.Controller.extend({

});
/*
    me = @
    $.ajax
      url: App.urls.register
      type: "POST"
      data:
      #would be nice if could do something like this
      #user: @currentModel.getJSON
      #(perhaps there is, but couldn't find)
        "user[name]": route.currentModel.name
        "user[email]": route.currentModel.email
        "user[password]": route.currentModel.password
        "user[password_confirmation]": route.currentModel.password_confirmation
      success: (data) ->
        me.set 'currentUser', data.user
        route.transitionTo 'home'
      error: (jqXHR, textStatus, errorThrown) ->
        route.controllerFor('registration').set "errorMsg", "That email/password combo didn't work.  Please try again"
*/