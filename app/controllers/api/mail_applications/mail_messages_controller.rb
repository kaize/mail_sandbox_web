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

    respond_with @message
  end

  def mark_read
    @message = resource_application.mail_messages.find(params[:id])
    @message.mark_read

    respond_with @message, location: nil
  end

end
