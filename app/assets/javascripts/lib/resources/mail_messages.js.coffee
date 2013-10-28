angular.module('app.resources.mail_messages', [])
  .factory 'mailMessages', (railsResourceFactory) ->
    mailMessages = railsResourceFactory
      url: Routes.api_mail_application_mail_message_path("{{mail_application_id}}", "{{id}}")
      name: 'mailMessage'

    mailMessages