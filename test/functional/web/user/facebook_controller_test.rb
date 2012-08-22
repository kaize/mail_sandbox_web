require 'test_helper'

class Web::User::FacebookControllerTest < ActionController::TestCase
  test "should get register" do
    get :register
    assert_response :success
  end

end
