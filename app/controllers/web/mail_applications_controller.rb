class Web::MailApplicationsController < Web::ProtectedApplicationController

  def index
    @applications = current_user.available_applications
  end

  def show
    @application = current_user.available_applications.find(params[:id]).decorate
  end

  def new
    @application = MailApplication.new
  end

  def create
    @application = current_user.mail_applications.build(params[:mail_application])

    if @application.save
      redirect_to mail_applications_path
    else
      render :action => :new
    end
  end

  def edit
    @application = current_user.mail_applications.find(params[:id])
  end

  def update
    @application = current_user.mail_applications.find(params[:id])

    if @application.update_attributes(params[:mail_application])
      redirect_to mail_applications_path
    else
      render :action => :edit
    end
  end

  def destroy
    @application = current_user.mail_applications.find(params[:id])

    @application.destroy
    redirect_to mail_applications_path
  end

end
