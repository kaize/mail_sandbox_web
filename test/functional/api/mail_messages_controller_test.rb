require 'test_helper'

class Api::MailMessagesControllerTest < ActionController::TestCase

  setup do
    @user = create :facebook_user
    sign_in @user

    @application = create :application
    @my_application = create :application, :owner => @user
    @member_application = create :application
    @member_application.members << @user
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
    message = create :mail_message, :mail_application => @my_application

    put :mark_read, :id => message.id, :format => :json
    assert_response :success
  end

  test "should delete" do
    message = create :mail_message, :mail_application => @my_application

    delete :destroy, :id => message.id, :format => :json
    message.reload

    assert_response :success
    assert message.deleted?
  end

  test "should delete message with member" do
    message = create :mail_message, :mail_application => @member_application

    delete :destroy, :id => message.id, :format => :json
    message.reload

    assert_response :success
    assert message.deleted?
  end

  test "should not delete" do
    message = create :mail_message, :mail_application => @application

    assert_raise ActiveRecord::RecordNotFound do
      delete :destroy, :id => message.id, :format => :json
    end

    message.reload
    assert !message.deleted?
  end

  test "should mark all as read" do
    messages = create_list :mail_message, 2, :mail_application => @my_application

    put :mark_all_as_read, :format => :json
    assert_response :success

    message = messages.first
    message.reload
    assert message.read?
  end
end
