require 'test_helper'

class Web::User::PasswordsControllerTest < ActionController::TestCase
  def setup
    @user = create :user
    @user.confirm
  end

  test "should get forget" do
    get :forget
    assert_response :success
  end

  test "should get reset" do
    params = {user_reset_password_type: @user.attributes}
    get :reset, params
    assert_response :redirect
  end

end
