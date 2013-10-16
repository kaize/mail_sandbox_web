class Api::MailApplicationsController < Api::ProtectedApplicationController

  def index
    @mail_applications = available_applications.decorate

    respond_with @mail_applications
  end

  def show
    @application = available_applications.find(params[:id]).decorate
    @messages = @application.mail_messages.ordered.page(params[:page]).per(params[:per_page])

    respond_with @application, @messages
  end

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
