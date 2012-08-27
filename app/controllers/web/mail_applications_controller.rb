class Web::MailApplicationsController < Web::ProtectedApplicationController

  def index
    @applications = current_user.available_applications.page(params[:page]).per(params[:per_page])
  end

  def show
    @application = current_user.available_applications.find(params[:id]).decorate
    @messages = @application.mail_messages.ordered.page(params[:page]).per(params[:per_page])
  end

  def new
    @application = MailApplicationType.new
    @users_collection = User.active.decorate
  end

  def create
    @application = current_user.mail_applications.build
    @application = @application.becomes(MailApplicationType)
    @application.assign_attributes params[:mail_application]

    if @application.save
      redirect_to mail_applications_path
    else
      render :action => :new
    end
  end

  def edit
    @application = current_user.available_applications.find(params[:id])
    @application = @application.becomes(MailApplicationType)
    @users_collection = User.active.decorate
  end

  def update
    @application = current_user.available_applications.find(params[:id])
    @application = @application.becomes(MailApplicationType)

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
