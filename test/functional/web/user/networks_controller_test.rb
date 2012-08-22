require 'test_helper'

class Web::User::NetworksControllerTest < ActionController::TestCase

  test "should get failure" do
    get :failure
    assert_response :redirect
  end
  
end
