require 'test_helper'

class Web::MailApplicationsControllerTest < ActionController::TestCase

  setup do
    @application = create :application
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
    get :edit, :id => @application.id
    assert_response :success
  end

  test "should put update" do
    put :update, :id => @application.id
    assert_response :redirect
  end

  test "should get show" do
    get :show, :id => @application.id
    assert_response :success
  end

  test "should delete" do
    delete :destroy, :id => @application.id
    assert_response :redirect
  end

end
