class Web::User::SessionsController < Web::ApplicationController
  skip_before_filter :authenticate_user!

  def new
  end

  def destroy
    sign_out
    redirect_to :root
  end
end
