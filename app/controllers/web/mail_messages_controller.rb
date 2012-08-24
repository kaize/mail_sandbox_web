class Web::MailMessagesController < Web::ProtectedApplicationController
  after_filter :mark_as_read, :only => [:show]

  def index
    @mail_application = MailApplication.find_by_id(params[:mail_application_id])

    if @mail_application
      @messages = @mail_application.mail_messages.ordered
    else
      @messages = MailMessage.ordered
    end
  end

  def show
    @message = MailMessage.find params[:id]
    @mail = Mail.new(@message.data)
  end

  private

  def mark_as_read
    @message.view
  end

end
