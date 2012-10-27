class Web::MailMessagesController < Web::ProtectedApplicationController

  def index
    @mail_application = MailApplication.find_by_id(params[:mail_application_id])
    @messages = @mail_application.mail_messages.ordered.page(params[:page]).per(params[:per_page])
  end

  def show
    @message = MailMessage.find params[:id]
    @message.mark_read if @message.unread?
  end

end
