class Api::MailApplications::ApplicationController < Api::ApplicationController

  def resource_application
    available_applications.find(params[:mail_application_id])
  end

  private

  def available_applications
    current_user.available_applications
  end
end
