module Web::MailMessagesHelper

  def recipient_list(application)
    application.mail_messages.uniq_by_recipients.pluck(:recipient)
  end

  def sender_list(application)
    application.mail_messages.uniq_by_senders.pluck(:sender)
  end

  def han_mail(attribute)
    han('mail_message', attribute)
  end

end