require 'test_helper'

class Web::User::GithubControllerTest < ActionController::TestCase

  test "should create user via Github" do
    @auth_data = generate(:github_auth)
    @request.env['omniauth.auth'] = @auth_data
    get :callback
    assert_response :redirect
  end

  test "should sign in via Github" do
    @auth_data = generate(:github_auth)
    user = create :github_user
    github_user = user.github
    @auth_data[:uid] = github_user.uid
    @request.env['omniauth.auth'] = @auth_data

    get :callback
    assert_response :redirect
    assert signed_in?
    assert_equal github_user.user.id, current_user.id
  end
end
