require 'test_helper'

class Web::User::FacebookControllerTest < ActionController::TestCase

  def setup
    @auth_data = generate(:facebook_auth)
  end

  test "should create user via Facebook" do
    @request.env['omniauth.auth'] = @auth_data
    get :register
    assert_response :redirect
  end

  test "should sign in via Facebook" do
    facebook_user = create('user/facebook')
    @auth_data[:uid] = facebook_user.uid
    @request.env['omniauth.auth'] = @auth_data

    get :register
    assert_response :redirect
    assert signed_in?
    assert_equal facebook_user.user.id, current_user.id
  end
  
   
end
