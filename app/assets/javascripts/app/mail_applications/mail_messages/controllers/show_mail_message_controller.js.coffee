angular.module('app.modules.mail_applications.mail_messages.controllers')
  .controller 'ShowMailMessageController',
    ($scope, $rootScope, mailMessages, $stateParams, $sce) ->

      $rootScope.currentShowingMessageId = parseInt($stateParams.mail_message_id)

      mailMessages.get({mail_application_id: $stateParams.id, id: $stateParams.mail_message_id}).then (message) ->
        $scope.resourceMessage = message

        if $scope.resourceMessage.state == 'unread'
          $rootScope.$broadcast('mail_message:mark_read', $scope.resourceMessage)

          params = { id: message.id, mail_application_id: $stateParams.id, state_event: 'mark_read' }
          new mailMessages(params).update()