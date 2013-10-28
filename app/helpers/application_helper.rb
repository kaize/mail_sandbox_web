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

  def default_search_form_options(options = {})
    { method: 'get', html: { class: 'form-inline' },
      defaults: { label: false, required: false } }.merge(options)
  end

  def han(model, attribute)
    model.to_s.classify.constantize.human_attribute_name(attribute)
  end

  def model_states(model, state_machine = :state)
    model.to_s.classify.constantize \
      .state_machines[state_machine] \
      .states
  end

end

