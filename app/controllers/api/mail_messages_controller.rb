class Api::MailMessagesController < ApplicationController
  respond_to :json

  def create
    @message = MailMessage.new(params[:message])
    @message.save
    #respond_with @message, :format => :json
    render :json => @message
  end
end
