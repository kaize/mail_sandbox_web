class MailApplicationDecorator < ApplicationDecorator
  decorates :mail_application
  decorates_association :owner

  def mail_application_settings
    settings = [
      "config.action_mailer.smtp_settings = {",
      ":address => '#{mail_application.address}',",
      ":port => #{mail_application.port},",
      ":user_name => '#{mail_application}',",
      ":password => '#{mail_application.password}'",
      "}"
    ]

    settings.map { |str| content_tag :span, str }.join('<br/>')
  end

  def unread_mails_count
    mail_messages.unreaded.count
  end

  def to_s
    name
  end

end
