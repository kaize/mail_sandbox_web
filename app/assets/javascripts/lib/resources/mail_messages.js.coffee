angular.module('app.resources.mail_messages', [])
  .factory 'mailMessages', (railsResourceFactory) ->
    mailMessages = railsResourceFactory
      url: Routes.api_mail_application_mail_message_path("{{mail_application_id}}", "{{id}}")
      name: 'mailMessage'

    mailMessages.batchUpdate = (params) ->
      @$patch(Routes.batch_update_api_mail_application_mail_messages_path(
        params.mail_application_id,
        ids: params.ids,
        mail_message: params.mail_message
        )
      )

    mailMessages