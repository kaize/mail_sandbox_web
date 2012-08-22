class Web::User::FacebookController < Web::User::NetworksController
  def register
    user = services.facebook.register(auth_hash)
    reset_session
    sign_in user
    flash.now[:notice] = flash_translate(:logged_in)
    redirect_to :root
  end
end
