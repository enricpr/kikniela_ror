App.BetsRoute = Ember.Route.extend({
  model: function() { return this.store.find('bet') }
})