angular.module('app.modules.mail_applications.mail_messages.controllers')
  .controller 'ShowMailMessageController',
    ($scope, $rootScope, mailMessages, railsRoutesHelper, $stateParams, $sce) ->
      #management dummy for message body(try to find better solution then rootScope))
      hideMessageDummy = ->
        $rootScope.messageDummy = false

      mailMessages.get({mail_application_id: $stateParams.id, id: $stateParams.mail_message_id}).then (message) ->
        $scope.resourceMessage = message
        $scope.resourceMessageBody = $sce.trustAsHtml(message.body)

        if $scope.resourceMessage.state == 'unread'
          $rootScope.$broadcast('mail_message:mark_read', $scope.resourceMessage)

          params = { id: message.id, mail_application_id: $stateParams.id, state_event: 'mark_read' }
          new mailMessages(params).update()

        $scope.resourceMessage.without_bootstrap_path ||=
          railsRoutesHelper.mail_message_without_bootstrap_path($scope.mailApp.id, message.id)

        hideMessageDummy()