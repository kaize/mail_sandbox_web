angular.module('app.modules.mail_applications.mail_messages.controllers')
  .controller 'RawMailMessageController',
    ($scope, mailApplications, mailMessages, $state, $stateParams, $sce) ->
       mailMessages.get({id: $stateParams.id, mail_application_id: $stateParams.mail_application_id}).then (mailMsg) ->
         $scope.resourceMessageBodyRaw = mailMsg.body