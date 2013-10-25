angular.module('app.services.resources.mail_messages', [])
  .factory 'mailMessages', (railsResourceFactory, $http) ->
    $http.defaults.headers['common']['Accept'] = 'application/json'

    mailMessages = railsResourceFactory
      url: Routes.api_mail_application_mail_message_path("{{mail_application_id}}", "{{id}}")
      name: 'mailMessage'

    mailMessages.markRead = (params) ->
      @$patch(Routes.mark_read_api_mail_application_mail_message_path(params.mail_application_id, params.id))

    mailMessages