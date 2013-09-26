module Services
  class EmailService
    def send_email_on_registration(user)
      UserMailer.send(:send_email_on_registration, user).deliver
    end
  end
end

