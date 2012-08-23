module ApplicationHelper
  include UrlHelpers

  def current_host
    request.host
  end

end
