class UserMailer < BaseMailer

  def send_email_on_registration(user)
    @user = user
    mail(:to => user.email)
  end

end
