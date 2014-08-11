App.BetsRoute = Ember.Route.extend({
  model: function() {
		return this.store.find('bet').then(function(bets) {
			return bets;
    }, function() {
				alert('broken!');
    });
	}
	
})