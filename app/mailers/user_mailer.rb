class UserMailer < BaseMailer

  def send_email_on_registration(user)
    @user = user
    @confirm_url = confirm_user_url(user, token: user.confirmation_token)

    mail(to: user.email)
  end

end
