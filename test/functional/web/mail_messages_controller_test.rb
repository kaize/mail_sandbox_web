require 'test_helper'

class Web::MailMessagesControllerTest < ActionController::TestCase
  def setup
    @user = create :user
    sign_in @user
    @message = create :mail_message
  end

  test "should get index" do
    get :index, :mail_application_id => @message.mail_application_id
    assert_response :success
  end

  test "should get show" do
    get :show, :id => @message.id
    assert_response :success
  end

end
