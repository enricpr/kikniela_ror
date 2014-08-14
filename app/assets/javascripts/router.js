App.Router.map(function() {
  this.route('home');
	this.route('games');
	this.resource('bets');
  this.route('sign_out');
	this.route('sign_in');
	this.route('users');
	
	/*
	this.resource('users', function() {
    this.route('sign_in');
  });
	this.resource('sessions', function() {
		this.route('new');
		this.route('destroy');
	});
	*/
});

App.Router.reopen({
	location: 'auto',
	rootURL: '/'
})
