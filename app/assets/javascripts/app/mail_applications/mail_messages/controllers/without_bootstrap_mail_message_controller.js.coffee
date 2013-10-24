angular.module('app.modules.mail_applications.mail_messages.controllers')
  .controller 'WithoutBootstrapMailMessageController',
    ($scope,mailMessages, $state, $stateParams, $sce) ->
       mailMessages.get({id: $stateParams.id, mail_application_id: $stateParams.mail_application_id}).then (message) ->
         $scope.resourceMessageBodyWithoutBootstrap = $sce.trustAsHtml(message.body)