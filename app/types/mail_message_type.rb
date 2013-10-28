class MailMessageType < MailMessage
  include BaseType

  permit :data, :recipient, :sender, :completed_at,
    :mail_application, :state_event
end