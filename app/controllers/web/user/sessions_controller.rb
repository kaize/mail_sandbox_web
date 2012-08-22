class Web::User::SessionsController < ApplicationController
  def new
  end

  def destroy
    sign_out
    redirect_to :root
  end
end
