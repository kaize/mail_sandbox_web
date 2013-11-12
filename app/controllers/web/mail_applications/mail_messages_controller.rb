class Web::MailApplications::MailMessagesController < Web::MailApplications::ApplicationController
  layout 'without_bootstrap', only: [:without_bootstrap]

  def without_bootstrap
    @message = resource_application.mail_messages.find(params[:id])

    @message.mark_read if @message.unread?
  end
end
