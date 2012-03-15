class Bigblue.Views.PurchaseorderEdit extends Backbone.View

	template: JST['purchaseorders/edit']

	render: ->
		$(@el).html(@template(model: @model))
		$(@el).modal()
		this