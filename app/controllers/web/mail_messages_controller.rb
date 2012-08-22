class Web::MailMessagesController < Web::ApplicationController
  def index
    @messages = MailMessage.web
  end
end
