class Web::MailApplicationsController < ApplicationController

  def index
    @applications = MailApplication.all
  end

end
