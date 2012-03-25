class Bigblue.Views.PurchaseordersCreate extends Backbone.View

	template: JST['purchaseorders/create']

	events:
		'click .save': 'save'

	initialize: ->

	render: ->
		me = @
		self = this

		$(me.el).html(me.template(model: me.model, shippers_collection: shippers))
		$(me.el).modal()
		$('.datepicker').datepicker()
		Backbone.ModelBinding.bind(me)
		Backbone.Validation.bind this,
			valid: (view, attr) ->
				console.log('valid!', view, attr)
			invalid: (view, attr, error) ->
				console.log('invalid!', view, attr, error)
		this
	
	save: ->
		if @model.isValid()
			console.log @model
