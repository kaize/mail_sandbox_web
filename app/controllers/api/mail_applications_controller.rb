class Api::MailApplicationsController < Api::ProtectedApplicationController

  def mark_all_messages_as_read
    application = available_applications.find(params[:id])
    messages = application.mail_messages.unreaded
    messages.update_all(state: :read)

    respond_with :status => :ok
  end

  private

    def available_applications
      current_user.available_applications
    end
end
