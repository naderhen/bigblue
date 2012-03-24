class PurchaseordersController < ApplicationController
	respond_to :json

	def index
		@purchaseorders = Purchaseorder.all
		respond_with @purchaseorders
	end

	def update
		@purchaseorder = Purchaseorder.find(params[:id])
		respond_with @purchaseorder.update_attributes!(params)
	end

	def show
		@purchaseorder = Purchaseorder.find(params[:id])
	end
end
