class Web::User::NetworksController < Web::ApplicationController

  def failure
    flash[:error] = flash_translate(:invalid_credentials)
    redirect_to :root
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
