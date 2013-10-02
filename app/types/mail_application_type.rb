class MailApplicationType < MailApplication
  include ApplicationType

  permit :member_ids, :name, :password
  attr_accessible :member_ids, :name, :password
end
