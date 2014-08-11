App.GamesRoute = Ember.Route.extend({

	model: function(controller) {
		return this.store.find('game').then(function(games) {
			return games;
    }, function() {
				alert('broken!');
    });

	},
	actions: {
		createBetFromGame: function(){		
			var tip = this.get("controller.newBet");
			var week = $('#week').val();
			var game = $('#game').val();
			var user = 1;
			console.log("tip:" + tip + " week:" + week + " game:" + game + " user:" + user);
			var bet = this.store.createRecord('bet', {tip: tip, week: week, game_id: game, user_id: user});

			bet.save();
			//this.get("controller").set("newBet", "");
			this.transitionTo("bets");
		},

	}

})