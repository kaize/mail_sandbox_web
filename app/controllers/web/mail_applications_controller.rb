class Web::MailApplicationsController < Web::ProtectedApplicationController

  def show
    @application = available_applications.find(params[:id]).decorate
    @messages = @application.mail_messages.ordered.page(params[:page]).per(params[:per_page])
  end

  def new
    @application = MailApplicationType.new
    @users_collection = User.active.decorate
  end

  def create
    @application = MailApplicationType.new(params[:mail_application])
    @application.owner = current_user

    if @application.save
      redirect_to mail_applications_path
    else
      render :action => :new
    end
  end

  def edit
    @application = available_applications.find(params[:id])
    @application = @application.becomes(MailApplicationType)
    @users_collection = User.active.decorate
  end

  def update
    @application = available_applications.find(params[:id])
    @application = @application.becomes(MailApplicationType)

    if @application.update_attributes(params[:mail_application])
      redirect_to mail_applications_path
    else
      render action: :edit
    end
  end

  def destroy
    @application = MailApplication.web.find(params[:id]) if current_user.admin?
    @application = current_user.owned_applications.find(params[:id])

    @application.mark_as_deleted
    redirect_to mail_applications_path
  end

  private

  def available_applications
    current_user.available_applications
  end

end
