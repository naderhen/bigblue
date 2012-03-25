class InventoryController < ApplicationController
  def home
  	@purchaseorders = Purchaseorder.all.to_a
  	@items = @purchaseorders.last.items
  	@shippers = Shipper.all.to_a
  	@warehouses = Warehouse.all.to_a
  end

end
