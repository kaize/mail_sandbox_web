require 'test_helper'

class Api::MailMessagesControllerTest < ActionController::TestCase

  setup do
    @application = create :application
  end

  test "should get create" do
    attrs = FactoryGirl.attributes_for(:mail_message, :sender => "unique@unique.ru")

    attrs[:user] = @application.name
    attrs[:password] = @application.password

    get :create, :message => attrs
    assert_response :success

    message = MailMessage.find_by_sender("unique@unique.ru")
    assert_not_nil message
  end

end
