App.BetsController = Ember.ArrayController.extend({
  sortProperties: ['week'],
	
	bets: function() {
		var userId = this.get('currentUser.id');
		return this.filter(function(bet) {
			return bet.get('user_id') == userId;
		})
	}.property('bet'),

	actions: {
		pushSort: function(attribute) {
			if (this.get("sortProperties.firstObject") == attribute) {
				this.toggleProperty("sortAscending");
			} else {
					this.set("sortProperties", [attribute]);
					this.set("sortAscending", true);
			}
		}
	}
})