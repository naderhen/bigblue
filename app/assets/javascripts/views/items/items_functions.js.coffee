class Bigblue.Views.ItemsFunctions extends Backbone.View
	template: JST['items/functions']

	events:
		'submit': 'save'

	render: ->
		$(@el).html(@template({item: @model}))
		this

	save: (event) ->
		console.log @model
		@model.trigger('change')
		event.preventDefault()