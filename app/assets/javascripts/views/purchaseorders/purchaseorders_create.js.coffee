class Bigblue.Views.PurchaseordersCreate extends Backbone.View

	template: JST['purchaseorders/create']

	events:
		'click .save': 'save'

	render: ->
		me = @
		self = this

		$(me.el).html(me.template(model: me.model, shippers_collection: shippers))
		$(me.el).modal()
		Backbone.ModelBinding.bind(me)
		this
	
	save: ->
		console.log @model