class Note
  include Mongoid::Document
  field :purchaseorder_id, :type => Integer
  field :content, :type => String
  field :user_id, :type => Integer

  belongs_to :purchaseorder
end
