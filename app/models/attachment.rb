class Attachment
  include Mongoid::Document
  include Rails.application.routes.url_helpers
  image_accessor :main_file

  field :purchaseorder_id, :type => Integer
  field :main_file_uid, :type => String
  field :main_file_name, :type => String
  
  belongs_to :purchaseorder

end
