class Api::MailMessagesController < Api::ApplicationController
  #TODO: auth for SMTP server
  before_filter :authenticate_user!, :except => :create

  def create
    @application = auth_application(params[:message][:user], params[:message][:password])

    @message = MailMessageBuilder.build params[:message]

    @application.mail_messages << @message
    @message.save

    respond_with @message
  end

  def mark_read
    @message = available_applications_messages.find(params[:id])
    @message.mark_read

    respond_with @message
  end

  def destroy
    @message = available_applications_messages.find(params[:id])
    @message.mark_as_deleted

    respond_with @message
  end

  def mark_all_as_read
    @messages = available_applications_messages.all
    @messages.each { |m| m.mark_read }

    respond_with @messages
  end

  protected

    def auth_application(name, password)
      MailApplication.find_by_credentials(name, password).first
    end

    def available_applications_messages
      current_user.available_applications_messages
    end

end
