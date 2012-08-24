class MailApplicationType < MailApplication
  include BaseType

  attr_accessible :member_ids
end
