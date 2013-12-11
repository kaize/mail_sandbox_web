angular.module('app.helpers.rails_routes', [])
  .factory "railsRoutesHelper", ($rootScope) ->
    mail_message_without_bootstrap_path: (mailAppId, mailMessageId) ->
      path = "/mail_applications/" + mailAppId + "/mail_messages/" +
        mailMessageId + "/without_bootstrap"