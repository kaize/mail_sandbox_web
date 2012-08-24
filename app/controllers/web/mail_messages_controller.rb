class Web::MailMessagesController < Web::ProtectedApplicationController
  after_filter :mark_as_read, :only => [:show]

  def index
    @mail_application = MailApplication.find_by_id(params[:mail_application_id])
    @messages = @mail_application.mail_messages.ordered.page(params[:page]).per(params[:per_page])
  end

  def show
    @message = MailMessage.find params[:id]
    @mail = Mail.new(@message.data)
  end

  private

  def mark_as_read
    @message.mark_read
  end

end
