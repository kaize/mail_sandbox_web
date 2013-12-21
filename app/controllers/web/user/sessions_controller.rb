class Web::User::SessionsController < Web::ApplicationController
  def new
    @session = UserSignInType.new
  end

  def create
    @session = UserSignInType.new(params[:user_sign_in_type])

    if @session.valid?
      user = @session.user
      sign_in user
      f(:success)
      redirect_to :root
    else
      f(:error)
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to :root
  end
end
