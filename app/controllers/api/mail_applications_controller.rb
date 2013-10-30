class Api::MailApplicationsController < Api::ProtectedApplicationController

  def index
    @mail_applications = available_applications.decorate

    respond_with @mail_applications
  end

  def show
    @application = available_applications.find(params[:id]).decorate

    respond_with @application
  end

  def create
    @application = MailApplicationType.new(params[:mail_application])
    @application.owner = current_user

    @application.save

    respond_with @application, location: nil
  end

  def update
    @application = available_applications.find(params[:id])
    @application = @application.becomes(MailApplicationType)

    @application.update(params[:mail_application])

    respond_with @application, location: nil
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
