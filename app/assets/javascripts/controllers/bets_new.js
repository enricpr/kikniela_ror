App.BetsNewController = Ember.Controller.extend({
	needs: "games",
	
  actions: {
    createBet: function() {
      var self = this;
      var bet = this.store.createRecord('bet', this.get('fields'));
      bet.save().then(function() {
        //self.transitionToRoute('games');
      });
    }
  }

});