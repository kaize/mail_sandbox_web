require 'test_helper'

class Api::MailApplications::MailMessagesControllerTest < ActionController::TestCase
  setup do
    @user = create :facebook_user
    sign_in @user

    @application = create :application, owner: @user

    @params = { mail_application_id: @application.id, format: :json }
  end

  test "should get index" do
    message = create :mail_message, mail_application: @application

    get :index, @params

    assert_response :success
  end
end
