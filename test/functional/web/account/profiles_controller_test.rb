require 'test_helper'

class Web::Account::ProfilesControllerTest < ActionController::TestCase
  def setup
    @user = create :admin_user
    sign_in @user
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end

  test "should put update" do
    put :update, user: attributes_for(:user), id: @user
    assert_response :redirect
  end

end
