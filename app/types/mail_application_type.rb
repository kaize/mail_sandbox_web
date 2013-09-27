class MailApplicationType < MailApplication
  include ApplicationType

  permit :member_ids, :name, :password
end
