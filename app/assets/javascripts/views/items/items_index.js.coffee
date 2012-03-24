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
			"sDom": 'W<"clear">lfrtip',
			"sPaginationType": "bootstrap",
			"oLanguage": {
				"sLengthMenu": "_MENU_ records per page"
			}
		});

		@$('.filter-widget').on 'blur', ->
			col_index = $(this).attr('data-column')

			items_table.fnFilter("^(0{0,2}[0-9]|0?[1-9][0-9]|1[0-7][0-9]|180)$", 4, true)

			if	$(this).val().length > 0
				filter_value = "^" + $(this).val() + "$"
				items_table.fnFilter(filter_value, col_index, true)
			else
				items_table.fnFilter('', col_index)
			
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
		@$('.selected').removeClass('icon-darkblue selected').addClass('unselected')
		event.preventDefault()