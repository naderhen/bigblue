object @purchaseorder
attributes :id, :po_number, :po_date

child :items do
	attributes :id, :po_number, :box_number, :item_number, :weight, :species, :grade
end

child :notes do
	attributes :id, :content, :user_id
end

child :shipper do
	attributes :id, :name
end