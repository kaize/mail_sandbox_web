class MailApplicationDecorator < ApplicationDecorator
  decorates_association :creator
  delegate_all

  def mail_application_settings
    settings = [
      "config.action_mailer.smtp_settings = {",
      ":address => '#{address}',",
      ":port => #{port},",
      ":user_name => '#{}',",
      ":password => '#{password}'",
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
