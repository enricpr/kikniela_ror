App.Router.map(function() {
  this.resource('games', {path:'/games'});
	this.resource('bets', {path: '/bets'}, function() {
			this.route('new');
	});
	this.resource('users', {path: '/users'});
});

App.Router.reopen({
	location: 'auto',
	rootURL: '/'
})
