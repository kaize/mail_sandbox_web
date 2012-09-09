require 'test_helper'

class Api::MailApplicationsControllerTest < ActionController::TestCase

  setup do
    @user = create :facebook_user
    sign_in @user

    @application = create :application
    @my_application = create :application, :owner => @user
    @member_application = create :application
    @member_application.members << @user
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
