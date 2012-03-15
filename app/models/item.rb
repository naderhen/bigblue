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
end
