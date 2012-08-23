require 'test_helper'

class Web::User::GithubControllerTest < ActionController::TestCase
  def setup
    @auth_data = generate(:github_auth)
  end

  test "should create user via Github" do
    @request.env['omniauth.auth'] = @auth_data
    get :callback
    assert_response :redirect
  end

  test "should sign in via Github" do
    github_user = create('user/github')
    @auth_data[:uid] = github_user.uid
    @request.env['omniauth.auth'] = @auth_data

    get :callback
    assert_response :redirect
    assert signed_in?
    assert_equal github_user.user.id, current_user.id
  end
end
