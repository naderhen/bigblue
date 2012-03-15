class Bigblue.Views.ItemsFunctions extends Backbone.View
	template: JST['items/functions']

	events:
		'submit': 'save'

	render: ->
		$(@el).html(@template({item: @model}))
		Backbone.ModelBinding.bind(this)
		this

	save: (event) ->
		event.preventDefault()
		@model.save()
		@model.trigger('change')