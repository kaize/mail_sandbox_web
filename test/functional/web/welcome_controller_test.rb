require 'test_helper'

class Web::WelcomeControllerTest < ActionController::TestCase

  def setup
    @user = create :user
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :redirect
  end

end
