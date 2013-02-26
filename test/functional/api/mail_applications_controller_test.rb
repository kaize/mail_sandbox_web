require 'test_helper'

class Api::MailApplicationsControllerTest < ActionController::TestCase

  setup do
    @user = create :facebook_user
    sign_in @user

    @my_application = create :application, :owner => @user
  end

  test "should mark all as read" do
    messages = create_list :mail_message, 2, :mail_application => @my_application

    put :mark_all_messages_as_read, :id => @my_application.id, :format => :json
    assert_response :success

    message = messages.first
    message.reload
    assert message.read?
  end

  test "should delete all messages" do
    create_list :mail_message, 2, :mail_application => @my_application

    put :destroy_all_messages, :id => @my_application.id, :format => :json
    assert_response :success

    messages_after_destroy = @my_application.mail_messages
    assert messages_after_destroy.blank?
  end
end
