App.Bet = DS.Model.extend({
  user: DS.belongsTo('user'),
  game: DS.belongsTo('game'),
  week: DS.attr('string'),
	tip: DS.attr('string'),
	hit: DS.attr('boolean'),
	updated_at: DS.attr('date'),
	
	fullGameBet: function() {
		return this.get('game.team1') + ' - ' + this.get('game.team2')
	}.property('game.team1', 'game.team2'),
	
	fullNameBet: function() {
		return this.get('user.name')
	}.property('name'),
	
	formatDate: function() {
		return moment(this.get('updated_at')).fromNow();
	}.property('updated_at')

})
/*,

DS.JSONSerializer.reopen({
	serializeBelongsTo: function(record, json, relationship) {
			var key = relationship.key,
					belongsToRecord = Ember.get(record, key);
			 
			if (relationship.options.embedded === 'always') {
					json[key] = belongsToRecord.serialize();
			}
			else {
					return this._super(record, json, relationship);
			}
	}
})
*/