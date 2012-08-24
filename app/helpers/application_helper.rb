module ApplicationHelper
  include UrlHelpers

  def current_host
    request.host
  end

  def per_page_selector
    per_page = params[:per_page] || configus.pagination.default_per_page
    select_tag :per_page, options_for_select(configus.pagination.per_page_list, per_page), :class => "per_page_selector"
  end

end
