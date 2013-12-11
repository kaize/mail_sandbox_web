class Api::MailMessagesController < Api::ProtectedApplicationController
  skip_before_filter :authenticate_user!, only: [:create, :last_minute_count]

  def create
    @application = auth_application(params[:message][:user], params[:message][:password])

    @message = MailMessageBuilder.build params[:message]

    @application.mail_messages << @message
    @message.save

    respond_with @message, location: nil
  end

  def destroy
    @message = available_applications_messages.find(params[:id])
    @message.mark_as_deleted

    respond_with @message
  end

  def last_minute_count
    count = MailMessage.last_minute_count
    respond_with count: count
  end

  protected

  def auth_application(name, password)
    MailApplication.by_credentials(name, password).first
  end

  def available_applications_messages
    current_user.available_applications_messages
  end

end
