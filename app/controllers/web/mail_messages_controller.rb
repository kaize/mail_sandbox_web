class Web::MailMessagesController < Web::ProtectedApplicationController
  layout 'without_bootstrap', :only => [:without_bootstrap]

  def message
    @message ||= MailMessage.find_by_id! params[:id]
  end

  def index
    @mail_application = MailApplication.find_by_id(params[:mail_application_id])
    @messages = @mail_application.mail_messages.ordered.page(params[:page]).per(params[:per_page])
  end

  def show
    message.mark_read if message.unread?
  end

  def raw
    render :text => message.data, :content_type => 'text/plain'

    message.mark_read if message.unread?
  end

  def without_bootstrap
    message.mark_read if message.unread?
  end
end
