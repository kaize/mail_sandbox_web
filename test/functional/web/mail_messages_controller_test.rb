require 'test_helper'

class Web::MailMessagesControllerTest < ActionController::TestCase

  setup do
    @message = create :mail_message
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show, :id => @message.id
    assert_response :success
  end

end
