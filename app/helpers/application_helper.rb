module ApplicationHelper
  include UrlHelpers

  def current_host
    request.host
  end

  def per_page_selector
    per_page = params[:per_page] || configus.pagination.default_per_page
    select_tag :per_page, options_for_select(configus.pagination.per_page_list, per_page), :class => "per_page_selector"
  end

  def bootstrap_flash_class_for(flash_type)
    case flash_type
      when :success
        "alert-success"
      when :error
        "alert-error"
      when :alert
        "alert-block"
      when :notice
        "alert-info"
      else
        flash_type.to_s
    end
  end

  def human_state_events_collection(object)
    object.state_events.map do |event|
      [object.class.human_state_event_name(event), event]
    end
  end

  def recipient_list(application)
    application.mail_messages.uniq_by_recipients.pluck(:recipient)
  end

  def sender_list(application)
    application.mail_messages.uniq_by_senders.pluck(:sender)
  end

end
