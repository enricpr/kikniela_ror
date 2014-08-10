App.Router.map(function() {
  this.resource('games', {path:'/games'});
	this.resource('bets', {path: '/bets'});
	this.resource('users', {path: '/users'});
});

App.Router.reopen({
	location: 'auto',
	rootURL: '/'
})
