require 'test_helper'

class Web::MailApplications::MailMessagesControllerTest < ActionController::TestCase
  def setup
    @user = create :user
    sign_in @user

    @application = create :application, creator: @user

    @message = create :mail_message, mail_application: @application

    @params = { mail_application_id: @application.id }

  end

  test "should get email without bootstrap" do
    get :without_bootstrap, @params.merge(id: @message.id)

    assert_response :success
  end

end
