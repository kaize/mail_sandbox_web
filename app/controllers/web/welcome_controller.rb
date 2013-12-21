class Web::WelcomeController < Web::ProtectedApplicationController
  APPS_NUMBER_ON_PAGE = 10

  def index
    @avaliable_apps = available_apps

    @recently_active_apps = @avaliable_apps.recently_active(APPS_NUMBER_ON_PAGE).decorate
    recently_active_apps_count = @recently_active_apps.count

    if @recently_active_apps.count < APPS_NUMBER_ON_PAGE
      @apps_without_messages = apps_without_messages(APPS_NUMBER_ON_PAGE - recently_active_apps_count)
    end

    @messages = current_user.admin ? MailMessage.recent : MailMessage.recent_by_user(current_user)
  end

  private

    def available_apps
      current_user.available_applications
    end

    def apps_without_messages(count)
      @avaliable_apps.without_messages(count).decorate
    end
end
