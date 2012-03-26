class Bigblue.Views.PurchaseorderUpload extends Backbone.View

	template: JST['purchaseorders/upload']

	render: ->
		$(@el).html(@template(model: @model))

		@$("#upload-attachment-form").submit ->
			$.ajax('/api/attachments',
				files: $(":file", this)
				data: $(":text", this).serializeArray()
				iframe: true
				type: "POST"
				processData: false
				dataType: "json"
				success: (data) ->
					
				)
			return false
		this