require 'test_helper'

class Web::UsersControllerTest < ActionController::TestCase
  def setup
    @user = create :admin_user
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @user.id
    assert_response :success
  end
  
  test "should put update" do
    put :update, :user => attributes_for(:user), :id => @user.id
    assert_response :redirect
  end
  
  test "should get show" do
    get :show, :id => @user.id
    assert_response :success
  end

end
