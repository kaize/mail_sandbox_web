require 'test_helper'

class Web::User::SessionsControllerTest < ActionController::TestCase
  def setup
    @user = create :user
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get destroy" do
    sign_in @user
    delete :destroy
    assert_response :redirect
    assert !signed_in?
  end

end
