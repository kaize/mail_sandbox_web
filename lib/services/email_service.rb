module Services
  class EmailService

    def send_email_on_registration(user)
      UserMailer.send(:send_email_on_registration, user).deliver
    end

    def send_password_reset_token(user)
      UserMailer.send(:send_password_reset_token, user).deliver
    end

  end
end

