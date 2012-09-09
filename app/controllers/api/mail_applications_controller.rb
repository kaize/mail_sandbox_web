class Api::MailApplicationsController < Api::ProtectedApplicationController

  def index
    @applications = current_user.available_applications
      .page(params[:page]).per(params[:per_page])
    @applications = @applications.decorate
  end

end
