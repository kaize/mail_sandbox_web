module ApplicationHelper
  include UrlHelpers

  def current_host
    request.host
  end

  def per_page_selector
    per_page = params[:per_page] || configus.pagination.default_per_page
    select_tag :per_page, options_for_select(configus.pagination.per_page_list, per_page), :class => "per_page_selector"
  end

  def default_search_form_options(options = {})
    { method: 'get', html: { class: 'form-inline' },
      defaults: { label: false, required: false } }.merge(options)
  end

  def recipient_list(application)
    application.mail_messages.uniq_by_recipients.pluck(:recipient)
  end

  def sender_list(application)
    application.mail_messages.uniq_by_senders.pluck(:sender)
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
