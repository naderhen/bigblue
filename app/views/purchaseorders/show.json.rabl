object @purchaseorder
attributes :id, :po_number, :po_date

child :items do
	attributes :id, :po_number, :box_number, :item_number, :weight, :species, :grade
end