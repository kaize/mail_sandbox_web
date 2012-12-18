class Api::MailApplicationsController < Api::ProtectedApplicationController

  def mark_all_messages_as_read
    application = available_applications.find(params[:id])
    messages = application.mail_messages
    messages.each { |m| m.mark_read }

    respond_with :status => :ok
  end

  private

    def available_applications
      current_user.available_applications
    end
end
