class Warehouse
  include Mongoid::Document
  field :short_name, :type => String

  has_many :purchaseorders

end
