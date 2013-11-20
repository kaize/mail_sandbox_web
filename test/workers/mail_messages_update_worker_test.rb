require 'test_helper'

class MailMessagesUpdateWorkerTest < ActiveSupport::TestCase
  setup do
    @worker = MailMessagesUpdateWorker.new

    @user = create :facebook_user
    @application = create :application, creator: @user

    @message = create :mail_message, mail_application: @application

    @params = { mail_application_id: @application.id, ids: [@message.id] }
  end

  test "#perform" do
    attrs = { state_event: :mark_read }
    @worker.perform @params.merge(mail_message: attrs)

    @message.reload

    assert { @message.read? }
  end
end