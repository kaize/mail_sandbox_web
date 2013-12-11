namespace :mail_application do

  desc "fill last_message_at"
  task set_last_message_at: :environment do
    MailApplication.find_each do |app|
      app_messages = app.mail_messages
      if app_messages.size != 0
        last_message = app_messages.recent(1).first
        if last_message
          app.last_message_at = last_message.completed_at
          app.save!
        end
      end
    end
  end
end