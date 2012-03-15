class Bigblue.Views.ItemsIndex extends Backbone.View

	template: JST['items/index']

	events:
		'click .batch-edit': 'batchEdit'
		'click .clear-batch': 'clearBatch'

	initialize: ->
		@collection.on('reset', @render, this)
		@collection.on('add', @appendItem, this)
		@batch_collection = new Bigblue.Collections.Items()
		@batch_collection.on('add remove reset', @updateBatch, this)

	render: ->
		purchaseorder = @.options.purchaseorder
		$(@el).html(@template(purchaseorder: purchaseorder, batch_collection: @batch_collection))
		@collection.each(@appendItem)
		items_table = @$('table').dataTable( {
			"sDom": "<'row'<'span10'l><'span10'f>r>t<'row'<'span5'i><'span10'p>>",
			"sPaginationType": "bootstrap",
			"oLanguage": {
				"sLengthMenu": "_MENU_ records per page"
			}
		});
		this

	appendItem: (item) =>
		purchaseorder = @.options.purchaseorder
		view = new Bigblue.Views.Item({model: item, purchaseorder: purchaseorder, batch_collection: @batch_collection})
		@$('table tbody').append(view.render().el)

	updateBatch: (event) ->
		@$('.batch-edit').find('span').html(@batch_collection.length)

	batchEdit: (event) ->
		batch_edit_view = new Bigblue.Views.ItemsBatchEdit(batch_collection: @batch_collection)
		batch_edit_view.render()
		event.preventDefault()

	clearBatch: (event) ->
		@batch_collection.reset()
		console.log(@batch_collection)
		console.log(@$('.selected'))
		@$('.selected').removeClass('icon-darkblue selected').addClass('unselected')
		event.preventDefault()
