class Airport
  include Mongoid::Document
  field :short_name, :type => String

  has_many :purchaseorders

end
