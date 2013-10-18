class Api::MailApplications::MailMessagesController < Api::MailApplications::ApplicationController

  def index
    @messages = resource_application.mail_messages.ordered.page(params[:page]).per(params[:per_page])

    meta = {
      total_pages: @messages.total_pages,
      per_page: params[:per_page] || Kaminari.config.default_per_page
    }

    respond_with @messages, root: "items", meta: meta
  end

end
