class Api::MailMessagesController < ApplicationController
  respond_to :json

  def create
    @application = auth_application(params[:message][:user], params[:message][:password])

    @message = MailMessageBuilder.build params[:message]

    @application.mail_messages << @message
    @message.save

    render :json => @message
  end

  protected

    def auth_application(name, password)
      MailApplication.find_by_credentials(name, password).first
    end

end
