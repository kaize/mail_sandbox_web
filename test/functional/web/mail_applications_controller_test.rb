require 'test_helper'

class Web::MailApplicationsControllerTest < ActionController::TestCase

  setup do
    @user = create :user
    sign_in @user

    @application = create :application
    @my_application = create :application, :owner => @user

    @attrs = FactoryGirl.attributes_for(:application)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should post create" do
    post :create
    assert_response :redirect
  end

  test "should get edit" do
    get :edit, :id => @my_application.id
    assert_response :success
  end

  test "should put update" do
    put :update, :id => @my_application.id, :mail_application => @attrs
    assert_response :redirect
  end

  test "should get show" do
    get :show, :id => @my_application.id
    assert_response :success
  end

  test "should delete" do
    delete :destroy, :id => @my_application.id
    assert_response :redirect
  end

end
