class Api::MailApplications::MailMessagesController < Api::MailApplications::ApplicationController

  def index
    scope = resource_application.mail_messages.ordered.page(params[:page]).per(params[:per_page]).ransack(params[:q])
    @messages = scope.result

    meta = {
      total_pages: @messages.total_pages,
      per_page: params[:per_page] || Kaminari.config.default_per_page
    }

    respond_with @messages, root: "items", meta: meta
  end

  def show
    @message = resource_application.mail_messages.find(params[:id])

    respond_with @message
  end

  def update
    @message = resource_application.mail_messages.find(params[:id])

    @message = @message.becomes(MailMessageType)

    @message.update(params[:mail_message])

    respond_with @message, location: nil
  end

  def batch_update
    @messages = resource_application.mail_messages.where(id: params["ids"]).find_each do |message|
      message = message.becomes(MailMessageType)
      message.update(params[:mail_message])
    end

    respond_with nil, location: nil
  end

end
