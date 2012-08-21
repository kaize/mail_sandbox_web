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

  test "should get edit" do
    get :edit, :id => @application.id
    assert_response :success
  end



end
