class MailMessageNotificationObserver < ActiveRecord::Observer
  observe :mail_message

  def after_create(message)
    FayeService.mail_message_new(message)
  end

end
