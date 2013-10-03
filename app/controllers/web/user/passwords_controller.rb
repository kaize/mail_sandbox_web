class Web::User::PasswordsController < Web::ApplicationController
  def forget
    @reset_password_form = UserResetPasswordType.new
  end

  def reset
    @reset_password_form = UserResetPasswordType.new params[:user_reset_password_type]

    if @reset_password_form.valid?
      user = @reset_password_form.user

      if user
        user.generate_reset_password_token
        user.save

        services.email_sender.send_password_reset_token(user)

        flash[:notice] = flash_translate(:reset_success)
        redirect_to account_root_path
      else
        flash[:error] = flash_translate(:user_not_found)
        redirect_to forget_user_password_path
      end
    else
      flash[:error] = flash_translate(:reset_failed)
      redirect_to forget_user_password_path
    end
  end
end
