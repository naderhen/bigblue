class Bigblue.Routers.Inventory extends Backbone.Router
	routes:
		'': 'index'
		'test': 'test'

	initialize: ->
		@purchaseorders = new Bigblue.Collections.Purchaseorders()
		@purchaseorders.fetch()
		@items_collection = new Bigblue.Collections.Items()
		@items_view = new Bigblue.Views.Item()

	index: ->
		purchase_orders_view = new Bigblue.Views.PurchaseordersIndex({collection: @purchaseorders, items_collection: @items_collection, items_view: @items_view})
		$('#left').html(purchase_orders_view.render().el)

	test: ->
		console.log 'test'