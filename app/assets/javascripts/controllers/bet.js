App.BetsController = Ember.ArrayController.extend({
  sortProperties: ['week'],
	
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