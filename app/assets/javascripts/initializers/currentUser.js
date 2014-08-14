Ember.Application.initializer({
  name: 'currentUser',

  initialize: function(container) {
    var store = container.lookup('store:main')
    var attributes = $('meta[name="current-user"]').attr('content')

    if (attributes) {
      var user = store.push('user', store.serializerFor(App.User).normalize(App.User, JSON.parse(attributes)))
      var controller = container.lookup('controller:currentUser').set('content', user)

      container.typeInjection('controller', 'currentUser', 'controller:currentUser')
		}
	}
});