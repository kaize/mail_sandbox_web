class Web::UsersController < Web::ProtectedApplicationController
  before_filter :authenticate_admin!

  def index
    @users = User.active.decorate
    respond_with @users
  end

  def show
    @user = User.find(params[:id]).decorate
    respond_with @user
  end

  def edit
    @user = User.find(params[:id])
    respond_with @user
  end

  def update
    @user = ModerateUserType.find(params[:id])
    if @user.update_attributes(params[:user])
      flash.now[:notice] = flash_translate(:success)
    else
      flash.now[:error] = flash_translate(:error)
    end
    respond_with @user
  end
end
