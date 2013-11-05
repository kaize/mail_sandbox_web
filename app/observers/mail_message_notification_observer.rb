class MailMessageNotificationObserver < ActiveRecord::Observer

  def after_create(message)
    FayeService.mail_message_new(message)
  end

end
