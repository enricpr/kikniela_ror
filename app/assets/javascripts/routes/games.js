App.GamesRoute = Ember.Route.extend({
	model: function(params) {
		return this.store.find('game')
	}
})