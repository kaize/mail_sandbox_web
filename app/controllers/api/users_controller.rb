class Api::UsersController < Api::ProtectedApplicationController

  def index
    @users = User.active.decorate

    respond_with @users
  end
end