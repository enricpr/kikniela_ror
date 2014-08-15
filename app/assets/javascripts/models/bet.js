App.Bet = DS.Model.extend({
  user_id: DS.attr('string'),
  game_id: DS.attr('number'),
  week: DS.attr('string'),
	tip: DS.attr('string'),
	hit: DS.attr('boolean'),
	updated_at: DS.attr('date'),
	
	/*
	fullGame: function() {
		return this.get('game.team1') + ' - ' + this.get('game.team2')
	}.property('team1', 'team2'),
	
	fullName: function() {
		return this.get('user.name')
	}.property('name'),
	*/
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