class Web::Account::ProfilesController < Web::ProtectedApplicationController
  def edit
    @user = current_user.becomes UserType
  end

  def update
    @user = current_user.becomes UserType

    if @user.update_attributes(params[:user])
      flash[:notice] = flash_translate(:success)
      redirect_to edit_account_profile_path
    else
      flash.now[:error] = flash_translate(:update_failed)
      render :edit
    end
  end
end
