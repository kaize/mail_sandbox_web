class Web::User::GithubController < Web::User::NetworksController
  def callback
    user = services.github.register(auth_hash)
    reset_session
    sign_in user
    flash.now[:notice] = flash_translate(:logged_in)
    redirect_to :root
  end
end
