class MailApplicationUserType < MailApplicationUser
  include BaseType

  permit :mail_application, :user
end