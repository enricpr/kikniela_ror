App.GamesController = Ember.ArrayController.extend({
  sortProperties: ['week'],
	betChoices: ["", "1", "X", "2"],

	games: function() {
		return this.get('searchWeek') ? this.get('searchedWeeks') : this
	}.property('searchWeek', 'searchedWeeks'),

	searchedWeeks: function() {
		var searchWeek = this.get('searchWeek')
		return this.filter(function(game) {
			return game.get('week').indexOf(searchWeek) != -1
		})
	}.property('searchWeek', 'this.@each.week'),

	actions: {
		pushSort: function(attribute) {
			if (this.get("sortProperties.firstObject") == attribute) {
				this.toggleProperty("sortAscending");
			} else {
					this.set("sortProperties", [attribute]);
					this.set("sortAscending", true);
			}
		},
		createBetFromGame: function(game){
			var tip = this.get("newBet");
			var week = game.get("week");
			var game = game.id;
			var user = 1;
			var bet = this.store.createRecord('bet', {tip: tip, week: week, game_id: game, user_id: user});
			bet.save();
			this.set("newBet", "");
			this.transitionToRoute("bets");
		}
	}
	
})