class Bigblue.Models.Shipper extends Backbone.Model
	url: -> 
		'/api/shippers/' + this.id