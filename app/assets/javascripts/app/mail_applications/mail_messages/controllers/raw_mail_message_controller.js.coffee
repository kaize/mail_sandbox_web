angular.module('app.modules.mail_applications.mail_messages.controllers')
  .controller 'RawMailMessageController',
    ($scope, mailMessages, $state, $stateParams) ->
       mailMessages.get({id: $stateParams.id, mail_application_id: $stateParams.mail_application_id}).then (message) ->
         $scope.resourceMessageRaw = message.data