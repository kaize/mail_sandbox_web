class Web::UsersController < Web::ProtectedApplicationController
  before_filter :authenticate_admin!, except: [:new, :create]
  skip_before_filter :authenticate_user!, only: [:new, :create]

  def index
    @users = User.active.page(params[:page]).per(params[:per_page])
    @users = @users.decorate
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

  def new
    @user = UserRegistrationType.new
  end

  def create
    @user = UserRegistrationType.new params[:user_registration_type]

    if @user.valid?
      redirect_to :root
    else
      render :new
    end
  end
end
