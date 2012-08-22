class ApplicationController < ActionController::Base
  protect_from_forgery
  include FlashHelper
  include AuthHelper
  helper_method :signed_in?, :current_user

  protected

  def services
    ServiceLocator.services
  end
end
