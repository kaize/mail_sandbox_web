angular.module('app.services.resources.mail_app_messages', [])
  .factory 'mailMessages', (railsResourceFactory) ->
    railsResourceFactory
      url: Routes.api_mail_application_mail_messages_path("{{mail_application_id}}")
      name: 'mailMessage'