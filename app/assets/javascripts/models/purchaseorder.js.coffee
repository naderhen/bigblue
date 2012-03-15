class Bigblue.Models.Purchaseorder extends Backbone.Model
	url: ->
		base = 'api/purchaseorders'
		if this.isNew()
			base
		else
			base + '/' + this.id;

	urlRoot: 'api/purchaseorders'

