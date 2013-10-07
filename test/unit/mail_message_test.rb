require 'test_helper'

class MailMessageTest < ActiveSupport::TestCase
  test "mail_subject" do
    message = create :mail_message
    assert { message.subject == message.mail.subject }
  end
end
