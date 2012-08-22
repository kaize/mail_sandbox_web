require 'test_helper'

class Web::UsersControllerTest < ActionController::TestCase
  def setup
    @user = create :user
    sign_in @user
  end

end
