class Bigblue.Models.User extends Backbone.Model
	url: -> 
		'/api/users/' + this.id