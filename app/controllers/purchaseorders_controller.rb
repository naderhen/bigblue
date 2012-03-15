class PurchaseordersController < ApplicationController
	respond_to :json

	def index
		@purchaseorders = Purchaseorder.all
		respond_with @purchaseorders
	end

	def show
		@purchaseorder = Purchaseorder.find(params[:id])
	end
end
