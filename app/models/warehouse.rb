class Warehouse
  include Mongoid::Document
  field :name, :type => String

  has_many :purchaseorders

end
