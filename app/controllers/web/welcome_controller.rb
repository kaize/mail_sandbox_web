class Web::WelcomeController < Web::ProtectedApplicationController
  def index
    @mail_applications = available_applications.recently_active.decorate

    @messages = current_user.mail_messages.recent
  end

  private

    def available_applications
      current_user.available_applications
    end
end
