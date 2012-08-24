require 'test_helper'

class Api::MailMessagesControllerTest < ActionController::TestCase

  setup do
    @application = create :application
  end

  test "should get create" do
    attrs = attributes_for(:mail_message, :sender => "unique@unique.ru")

    attrs[:user] = @application.name
    attrs[:password] = @application.password

    post :create, :message => attrs, :format => :json
    assert_response :success

    message = MailMessage.find_by_sender("unique@unique.ru")
    assert_not_nil message
  end

  test "should mark read" do
    message = create :mail_message

    post :mark_read, :id => message.id, :format => :json
    assert_response :success
  end

  test "should hide" do
    message = create :mail_message

    post :hide, :id => message.id, :format => :json
    assert_response :success
  end

end
