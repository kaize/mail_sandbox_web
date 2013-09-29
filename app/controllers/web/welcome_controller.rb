class Web::WelcomeController < Web::ProtectedApplicationController
  def index
    @applications = MailApplication.all
    @messages = current_user.mail_messages.recent
  end
end
