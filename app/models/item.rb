class Item
  include Mongoid::Document
  field :purchaseorder_id, :type => Integer
  field :box_number, :type => Integer
  field :item_number, :type => Integer
  field :weight, :type => Float
  field :species, :type => String
  field :subspecies, :type => String
  field :shipper_grade, :type => String
  field :core_grade, :type => String
  field :tail_grade, :type => String
  field :bloodline_grade, :type => String
  field :freshness, :type => String
  field :texture, :type => String
  field :fat, :type => String
  field :comments, :type => String
  field :cut, :type => String
  field :location, :type => String
  field :fresh, :type => Boolean
  field :price, :type => Float

  belongs_to :purchaseorder

  def po_number
    self.purchaseorder.po_number
  end

  def sizes
  	case self.species.to_lower
  	when "yf"
  		return ["30/40", "40/60", "60+"]
  	when "sword"
  		return ["Under 50", "50/69", "70/99", "100+"]
  	when "snapper"
  		return ["1-2", "2-4", "4-6", "OTHER"]
  	when "grouper"
  		return ["1-2", "2-4", "4-6", "OTHER"]
  	when "WAHOO"
  		return ["5-", "10-", "15+", "20+", "OTHER"]
  	when "MAHI"
  		return ["5-10", "10+", "15+", "20+", "OTHER"]
  	end	
  end

end
