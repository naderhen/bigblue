class Item
  include Mongoid::Document
  include Mongoid::History::Trackable

  field :purchaseorder_id, :type => Integer
  field :box_number, :type => Integer
  field :item_number, :type => Integer
  field :weight, :type => Float
  field :code, :type => String
  field :cost, :type => Float
  field :grade_notes, :type => String
  field :comments, :type => String
  field :description, :type => String
  field :species, :type => String
  field :subspecies, :type => String

  field :shipper_grade, :type => String
  field :core_grade, :type => String
  field :freshness_grade, :type => String
  field :texture_grade, :type => String
  field :tail_grade, :type => String
  field :fat, :type => String
  field :cut, :type => String
  field :location, :type => String
  field :fresh, :type => Boolean

  belongs_to :purchaseorder

  after_create :parse_code

  track_history :on => :all

  def parse_code
    item_code = Item_Code.where(code: code).first
    self.species = item_code.species
    self.subspecies = item_code.subspecies
    save!
  end

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
