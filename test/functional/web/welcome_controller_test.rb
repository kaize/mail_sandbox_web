require 'test_helper'

class Web::WelcomeControllerTest < ActionController::TestCase

  def setup
    @user = create :user
    sign_in @user
  end

  test "should get index" do
    application = create :application, creator: @user
    message = create :mail_message, mail_application: application

    application2 = create :application, creator: @user

    get :index
    assert_response :success
  end

end
