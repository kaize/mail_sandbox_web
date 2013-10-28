class Api::MailApplications::MailMessagesController < Api::MailApplications::ApplicationController

  def index
    @messages = resource_application.mail_messages.ordered.page(params[:page]).per(params[:per_page])

    meta = {
      total_pages: @messages.total_pages,
      per_page: params[:per_page] || Kaminari.config.default_per_page
    }

    respond_with @messages, root: "items", meta: meta
  end

  def show
    @message = resource_application.mail_messages.find(params[:id])

    FayeService.mail_message_new(@message)

    respond_with @message
  end

  def update
    @message = resource_application.mail_messages.find(params[:id])

    @message = @message.becomes(MailMessageType)

    @message.update(params[:mail_message])

    respond_with @message, location: nil
  end

end
