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

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get confirm" do
    get :confirm, id: @user
    assert_response :redirect
  end

  test "should get reset" do
    get :reset, id: @user
    assert_response :redirect
  end

  test "should post create" do
    attrs = attributes_for(:user)
    post :create, user: attrs
    assert_response :redirect

    user = User.find_by(email: attrs[:email])
    assert { user }
  end

  test "should destroy" do
    delete :destroy, id: @user
    assert_response :redirect
  end

end
