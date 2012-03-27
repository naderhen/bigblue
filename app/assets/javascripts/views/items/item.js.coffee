class Bigblue.Views.Item extends Backbone.View
	template: JST['items/item']
	tagName: 'tr'

	events: 
		'click .unselected': 'addToSelection'
		'click .selected': 'removeFromSelection'
		'click .icon-search': 'loadFunctions'

	initialize: ->
		@.on('change', @render, this)
		@batch_collection = @.options.batch_collection

	render: ->
		console.log('come on')
		purchaseorder = @.options.purchaseorder
		$(@el).html(@template({item: @model, purchaseorder: purchaseorder}))
		this

	addToSelection: (event) ->
		self = @
		checkbox = $(event.currentTarget)
		checkbox.removeClass('unselected').addClass('icon-darkblue selected')
		@batch_collection.add(@model)

	removeFromSelection: (event) ->
		self = @
		checkbox = $(event.currentTarget)
		checkbox.removeClass('icon-darkblue selected').addClass('unselected')
		@batch_collection.remove(@model)

	loadFunctions: (event) ->
		functions_view = new Bigblue.Views.ItemsFunctions(model: @model)
		$('#right').html(functions_view.render().el).fadeIn()
		Backbone.ModelBinding.bind(functions_view);