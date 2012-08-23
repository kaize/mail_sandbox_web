class Api::MailMessagesController < Api::ApplicationController

  def create
    @application = auth_application(params[:message][:user], params[:message][:password])

    @message = MailMessageBuilder.build params[:message]

    @application.mail_messages << @message
    @message.save

    respond_render :success => true, :body => @message
  end

  # mark mail message as 'read'
  def update
    @message = MailMessage.find(params[:id])

    if @message.view
      respond_render :success => true, :body => { :success => t(".marked_as_read") }
    else
      respond_render :success => false, :body => { :error => t(".failed_to_marks_as_read") }
    end
  end

  # mark mail message as deleted
  def destroy
    @message = MailMessage.find(params[:id])

    if @message.hide
      respond_render :success => true, :body => { :success => t(".deleted") }
    else
      respond_render :success => false, :body => { :error => t(".failed_to_delete") }
    end
  end

  protected

  def auth_application(name, password)
    MailApplication.find_by_credentials(name, password).first
  end

end
