App.UsersRoute = Ember.Route.extend({
    model: function(params) {
		return this.store.find('user').then(function(users) {
			return users;
    }, function() {
				alert('broken!');
    });
	}
})