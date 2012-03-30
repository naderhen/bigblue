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

  $(document).ajaxSend (e, xhr, options) ->
    token = $("meta[name='csrf-token']").attr("content")
    xhr.setRequestHeader "X-CSRF-Token", token