class Web::UsersController < Web::ProtectedApplicationController
  before_filter :authenticate_admin!

  def index
    @users = User.active.decorate
  end

  def show
    @user = User.find(params[:id]).decorate
  end

  def edit
    
  end

  def update
    
  end
end
