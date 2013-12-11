class Web::WelcomeController < Web::ProtectedApplicationController
  def index
    @mail_applications = available_applications
    @recent_mail_applications = @mail_applications.recently_active.decorate

    @messages = current_user.admin ? MailMessage.recent : MailMessage.recent_by_user(current_user)
  end

  private

    def available_applications
      current_user.available_applications
    end
end
