require 'test_helper'

class Api::UsersControllerTest < ActionController::TestCase

 setup do
    @user = create :facebook_user
    sign_in @user

    @params = { format: :json }
  end

  test "should get index" do
    get :index, @params

    assert_response :success
  end

end