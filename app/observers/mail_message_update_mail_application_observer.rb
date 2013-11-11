class MailMessageUpdateMailApplicationObserver < ActiveRecord::Observer
  observe :mail_message

  def after_commit(message)
    if message.send(:transaction_include_any_action?, [:create])
      mail_application = message.mail_application

      mail_application.last_message_at = message.created_at

      mail_application.save!
    end
  end

end