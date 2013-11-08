namespace :sandbox do

  desc "mail subject"
  task mail_subject: :environment do
    MailMessage.where(subject: nil).find_each do |message|
      message.subject = message.mail.subject
      message.save!
    end
  end
end