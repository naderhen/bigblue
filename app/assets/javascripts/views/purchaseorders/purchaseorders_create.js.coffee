class Bigblue.Views.PurchaseordersCreate extends Backbone.View

	template: JST['purchaseorders/create']

	render: ->
		$(@el).html(@template())
		$(@el).modal()
		this