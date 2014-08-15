App.BetsRoute = Ember.Route.extend({
	model: function(params) {
		return this.store.find('bet')
	}
})