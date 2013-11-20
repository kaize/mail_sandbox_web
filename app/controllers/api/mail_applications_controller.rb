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
    @application = MailApplicationType.new(params[:mail_application]).decorate
    @application.creator = current_user

    @application.save

    respond_with @application, location: nil
  end

  def update
    @application = available_applications.find(params[:id])
    @application = @application.becomes(MailApplicationType)

    @application.update(params[:mail_application])

    respond_with @application, location: nil
  end

  def destroy
    @application = available_applications.find(params[:id])
    @application.destroy

    respond_with @application
  end

  private

  def available_applications
    current_user.available_applications
  end

end
