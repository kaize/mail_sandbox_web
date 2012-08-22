class Web::MailMessagesController < Web::ApplicationController
  def index
    @messages = MailMessage.web
  end

  def show
    @message = MailMessage.find params[:id]
    @mail = Mail.new(@message.data)
  end
end
