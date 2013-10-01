class UserMailer < BaseMailer

  def send_email_on_registration(user)
    @user = user
    @confirm_url = confirm_user_url(user, token: user.confirmation_token)

    mail(to: user.email)
  end

  def send_password_reset_token(user)
    @user = user
    @reset_password_url = reset_user_url(user, token: user.reset_password_token)

    mail(to: user.email)
  end

end
