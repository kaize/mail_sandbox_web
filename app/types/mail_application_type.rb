class MailApplicationType < MailApplication
  include ApplicationType

  permit :password, :name, member_ids: []
end
