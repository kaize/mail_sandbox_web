class Web::MailMessagesController < Web::ProtectedApplicationController
  def index
    @mail_application = MailApplication.find_by_id(params[:mail_application_id])

    if @mail_application
      @messages = @mail_application.mail_messages.web
    else
      @messages = MailMessage.web
    end
  end

  def show
    @message = MailMessage.find params[:id]
    @mail = Mail.new(@message.data)
  end
end
