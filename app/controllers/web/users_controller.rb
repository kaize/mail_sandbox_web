class Web::UsersController < Web::ProtectedApplicationController
  before_filter :authenticate_admin!, except: [:new, :create, :confirm, :reset]
  skip_before_filter :authenticate_user!, only: [:new, :create, :confirm, :reset]

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
    @user = ModerateUserType.find(params[:id])
    @user = @user.decorate

    respond_with @user
  end

  def update
    @user = ModerateUserType.find(params[:id])
    @user = @user.decorate

    if @user.update_attributes(params[:user])
      flash[:notice] = flash_translate(:success)
    else
      flash[:error] = flash_translate(:error)
    end

    respond_with @user, location: users_path
  end

  def new
    @user = UserRegistrationType.new
  end

  def create
    @user = UserRegistrationType.new params[:user]
    if @user.valid?
      @user.generate_confirmation_token
      @user.save
      services.email_sender.send_email_on_registration(@user)
      f(:need_confirm)
      redirect_to :root
    else
      render :new
    end
  end

  def confirm
    @user = ::User.where(confirmation_token: params[:token]).first

    if @user && @user.waiting_confirmation?
      if @user.confirm
        sign_in @user
      else
        flash[:error] = flash_translate(:confirmation_failed)
      end
    else
      flash[:error] = flash_translate(:user_not_found)
    end

    redirect_to :root
  end

  def reset
    @user = ::User.where(reset_password_token: params[:token]).first

    if @user && @user.active?
      sign_in @user

      flash[:notice] = flash_translate(:password_was_reset)
      redirect_to edit_account_profile_path
    else
      flash[:error] = flash_translate(:user_not_found)
      redirect_to :root
    end
  end

  def destroy
    @user = ::User.find(params[:id])
    @user.hide

    redirect_to users_path
  end
end
