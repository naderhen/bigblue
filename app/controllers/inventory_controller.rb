class InventoryController < ApplicationController
  def home
  	@purchaseorders = Purchaseorder.all.to_a
  	@items = @purchaseorders.last.items
  end

end
