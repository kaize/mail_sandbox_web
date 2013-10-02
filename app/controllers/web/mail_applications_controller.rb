class Web::MailApplicationsController < Web::ProtectedApplicationController

  def index
    @applications = available_applications.page(params[:page]).per(params[:per_page])
    @applications = @applications.decorate
  end

  def show
    @application = available_applications.find(params[:id]).decorate
    scope = @application.mail_messages.ordered.page(params[:page]).per(params[:per_page]).ransack(params[:q])
    @messages = scope.result
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
      render :action => :edit
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
