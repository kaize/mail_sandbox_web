require 'test_helper'

class MailMessageTest < ActiveSupport::TestCase
  test "mail_subject" do
    message = create :mail_message
    assert { message.subject == message.mail.subject }
  end

  test "mail_application_update" do
    message = create :mail_message
    assert { message.mail_application.last_message_at == message.completed_at }
  end
end
