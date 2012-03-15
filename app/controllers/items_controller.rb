class ItemsController < ApplicationController
	respond_to :json

	def index
		@items = Item.all
		respond_with @items
	end

	def update
		@item = Item.find(params[:id])
		respond_with @item.update_attributes!(params)
	end
end
