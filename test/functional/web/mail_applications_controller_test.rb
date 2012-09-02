require 'test_helper'

class Web::MailApplicationsControllerTest < ActionController::TestCase

  setup do
    @user = create :facebook_user
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

    @my_application.reload
    assert @my_application.deleted?
  end

  test "should not put update to not my app" do
    assert_raise ActiveRecord::RecordNotFound do
      put :update, :id => @application.id, :mail_application => @attrs
    end
  end

  test "should not get show" do
    assert_raise ActiveRecord::RecordNotFound do
      get :show, :id => @application.id
    end
  end

  test "should get show to available application" do
    @application.members << @user
    get :show, :id => @application.id
    assert_response :success
  end

  test "should delete for admin" do
    admin = create :admin_user
    sign_in admin

    delete :destroy, :id => @application.id
    assert_response :redirect

    @application.reload
    assert @application.deleted?
  end



end
