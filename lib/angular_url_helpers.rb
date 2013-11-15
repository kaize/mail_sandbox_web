module AngularUrlHelpers

  def self.mail_applications_path
    "/mail_applications"
  end

  def self.mail_application_path(application)
    "/mail_applications/#{application.id}"
  end

  def self.new_mail_application_path
    "/mail_applications/new"
  end

end