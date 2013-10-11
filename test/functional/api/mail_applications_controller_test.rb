require 'test_helper'
SimpleCov.command_name "test:functionals"

class Api::MailApplicationsControllerTest < ActionController::TestCase

  setup do
    @user = create :facebook_user
    sign_in @user

    @my_application = create :application, :owner => @user

    @params = {format: :json}
  end

  test "should get show" do
    get :show, @params.merge(id: @my_application.id)
    assert_response :success
  end

  test "should mark all as read" do
    messages = create_list :mail_message, 2, :mail_application => @my_application

    put :mark_all_messages_as_read, :id => @my_application.id, :format => :json
    assert_response :success

    message = messages.first
    message.reload
    assert message.read?
  end
end
