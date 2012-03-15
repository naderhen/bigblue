class Purchaseorder
  include Mongoid::Document
  field :po_number, :type => Integer
  field :po_date, :type => Date
  field :shipper_id, :type => Integer
  field :active, :type => Boolean
  field :locale, :type => String
  field :origin, :type => String
  field :packing_location, :type => String
  field :airline, :type => String
  field :customs_broker, :type => String
  field :date_of_arrival, :type => Date

  belongs_to :shipper
  belongs_to :warehouse
  has_many :items

  def shipper_name
    self.shipper.name
  end

  def locale
    if self.warehouse
      self.warehouse.name
    else
      'TBD'
    end
  end

end
