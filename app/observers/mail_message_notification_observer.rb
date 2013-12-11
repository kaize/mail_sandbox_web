class MailMessageNotificationObserver < ActiveRecord::Observer
  observe :mail_message

  def after_commit(message)
    if message.send(:transaction_include_any_action?, [:create])
      FayeService.mail_message_new(message)
    end
  end

end
