class MailMessageType < MailMessage
  include ApplicationType

  permit :data, :recipient, :sender, :completed_at,
    :mail_application, :state_event
end