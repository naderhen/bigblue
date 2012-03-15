window.Bigblue =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
  	new Bigblue.Routers.Inventory
  	Backbone.history.start()

$(document).ready ->
  Bigblue.init()
  $('.dropdown-toggle').dropdown()
