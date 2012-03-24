class Bigblue.Views.PurchaseorderEdit extends Backbone.View

	template: JST['purchaseorders/edit']

	events: 
		'click .submit-edit': 'edit'

	render: ->
		me = @
		self = this
		model = me.model

		model.fetch({
			success: ->
				@shippers_collection = new Bigblue.Collections.Shippers
				@shippers_collection.fetch({
					success: ->
						$(me.el).html(me.template(model: model, shippers_collection: @shippers_collection))
						Backbone.ModelBinding.bind(self)
						$(me.el).modal()
				})
		})
		this

	edit: (event) ->
		@model.save()
