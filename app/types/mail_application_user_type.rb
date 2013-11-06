class MailApplicationUserType < MailApplicationUser
  include ApplicationType

  permit :mail_application, :user
end