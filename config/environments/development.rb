MailSandboxWeb::Application.configure do
  config.cache_classes = false
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  config.action_mailer.delivery_method = ENV['USER'] == 'vagrant' ? :letter_opener_web : :letter_opener
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = true

  config.active_support.deprecation = :log
  config.action_dispatch.best_standards_support = :builtin

  config.assets.compress = false
  config.assets.debug = true
end
