class Item_Code
  include Mongoid::Document
  field :code, :type => String
  field :species, :type => String
  field :subspecies, :type => String
end
