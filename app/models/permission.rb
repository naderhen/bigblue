class Permission
  include Mongoid::Document
  field :user_id, :type => Integer
  field :action, :type => String
  field :subject_class, :type => String
  field :subject_id, :type => Integer

  belongs_to :user
end
