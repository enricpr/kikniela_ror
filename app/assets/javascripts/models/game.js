App.Game = DS.Model.extend({
  team1: DS.attr('string'),
  team2: DS.attr('string'),
  result: DS.attr('string'),
  week: DS.attr('string'),
	deadline: DS.attr('date'),
	bets: DS.hasMany('bet', {embedded: 'always'}),
	
	fullGame: function() {
		return this.get('team1') + ' - ' + this.get('team2')
	}.property('team1', 'team2'),
	
	weekId: function() {
		return 'w' + this.get('id')
	}.property('id'),
	
	fillStyle: function() {
		if (Date.now() < this.get('deadline')) {
			if ((this.get('deadline') - Date.now()) < 18000000) {
				return 'color: orange';
			} else {
				return 'color: limegreen';
			}
		} else {
			return 'color: darkred';
		}
	}.property('deadline'),

	toDeadline: function() {
		if (Date.now() < this.get('deadline')) {
			return moment(this.get('deadline')).fromNow();
		} else {
			return "Finalitzat";
		}
	}.property('deadline')
	

})

DS.JSONSerializer.reopen({ // or DS.RESTSerializer
	serializeHasMany: function(record, json, relationship) {
		var originalKey = relationship.key;
		var key = Ember.String.decamelize(Ember.String.singularize(originalKey));

		key += "_ids";

		var relationshipType = DS.RelationshipChange.determineRelationshipType(record.constructor, relationship);

		if (relationshipType === 'manyToNone' || relationshipType === 'manyToMany' || relationshipType === 'manyToOne') {
			json[key] = record.get(originalKey).mapBy('id');
		}
	}
});

App.ApplicationSerializer = DS.RESTSerializer.extend({
    /**
     The current ID index of generated IDs
     @property
     @private
    */
    _generatedIds: 0,
     
    /**
     Sideload a JSON object to the payload
      
     @method sideloadItem
     @param {Object} payload   JSON object representing the payload
     @param {subclass of DS.Model} type   The DS.Model class of the item to be sideloaded
     @param {Object} item JSON object   representing the record to sideload to the payload
    */
    sideloadItem: function(payload, type, item){
        var sideloadKey = type.typeKey.pluralize(),     // The key for the sideload array 
            sideloadArr = payload[sideloadKey] || [],   // The sideload array for this item
            primaryKey = Ember.get(this, 'primaryKey'), // the key to this record's ID
            id = item[primaryKey];
                     
        // Missing an ID, generate one
        if (typeof id == 'undefined') {
            id = 'generated-'+ (++this._generatedIds);
            item[primaryKey] = id;
        }
         
        // Don't add if already side loaded
        if (sideloadArr.findBy("id", id) != undefined){
            return payload;
        }
         
        // Add to sideloaded array
        sideloadArr.push(item);
        payload[sideloadKey] = sideloadArr;  
        return payload;
    },
     
    /**
     Extract relationships from the payload and sideload them. This function recursively 
     walks down the JSON tree
      
     @method sideloadItem
     @param {Object} payload   JSON object representing the payload
     @paraam {Object} recordJSON   JSON object representing the current record in the payload to look for relationships
     @param {Object} recordType   The DS.Model class of the record object
    */
    extractRelationships: function(payload, recordJSON, recordType){
        // Loop through each relationship in this record type
        recordType.eachRelationship(function(key, relationship) {
            var related = recordJSON[key], // The record at this relationship
                type = relationship.type;  // The model type
             
            if (related){
                 
                // One-to-one
                if (relationship.kind == "belongsTo") {
                    // Sideload the object to the payload
                    this.sideloadItem(payload, type, related);
     
                    // Replace object with ID
                    recordJSON[key] = related.id;
                     
                    // Find relationships in this record
                    this.extractRelationships(payload, related, type);
                }
                 
                // Many
                else if (relationship.kind == "hasMany") {
     
                    // Loop through each object
                    related.forEach(function(item, index){
     
                        // Sideload the object to the payload
                        this.sideloadItem(payload, type, item);
     
                        // Replace object with ID
                        related[index] = item.id;
                         
                        // Find relationships in this record
                        this.extractRelationships(payload, item, type);
                    }, this);
                }
                 
            }
        }, this);
         
        return payload;
    },
 
 
    /**
     Overrided method
    */
    normalizePayload: function(type, payload) {
        var typeKey = type.typeKey,
            typeKeyPlural = typeKey.pluralize();
         
        payload = this._super(type, payload);
         
        // Many items (findMany, findAll)
        if (typeof payload[typeKeyPlural] != "undefined"){
            payload[typeKeyPlural].forEach(function(item, index){
                this.extractRelationships(payload, item, type);
            }, this);
        }
         
        // Single item (find)
        else if (typeof payload[typeKey] != "undefined"){
            this.extractRelationships(payload, payload[typeKey], type);
        }
         
        return payload;
    },
});