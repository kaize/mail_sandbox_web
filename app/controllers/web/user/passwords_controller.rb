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
        redirect_to root_path
      else
        flash[:error] = flash_translate(:user_not_found)
        render :forget
      end
    else
      flash[:error] = flash_translate(:reset_failed)
      render :forget
    end
  end
end
