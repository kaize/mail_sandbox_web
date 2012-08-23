require 'test_helper'

class Web::User::FacebookControllerTest < ActionController::TestCase

  test "should create user via Facebook" do
    @auth_data = generate(:facebook_auth)
    @request.env['omniauth.auth'] = @auth_data
    get :callback
    assert_response :redirect
  end

  test "should sign in via Facebook" do
    @auth_data = generate(:facebook_auth)
    facebook_user = create('user/facebook')
    @auth_data[:uid] = facebook_user.uid
    @request.env['omniauth.auth'] = @auth_data

    get :callback
    assert_response :redirect
    assert signed_in?
    assert_equal facebook_user.user.id, current_user.id
  end
  
   
end
