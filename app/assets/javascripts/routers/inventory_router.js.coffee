class Bigblue.Routers.Inventory extends Backbone.Router
	routes:
		'': 'index'

	initialize: ->
		@purchaseorders = new Bigblue.Collections.Purchaseorders()
		@purchaseorders.fetch()

	index: ->
		purchase_orders_view = new Bigblue.Views.PurchaseordersIndex({collection: @purchaseorders})
		$('#left').html(purchase_orders_view.render().el)