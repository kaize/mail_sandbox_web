angular.module('app.modules.mail_applications.controllers')
  .controller 'MenuMailApplicationController',
    ($scope, mailApplications, $state, $stateParams) ->

      mailAppId = $stateParams.mail_application_id || $stateParams.id

      mailApplications.get(mailAppId).then (mailApp)->
        $scope.mailApp = mailApp

      $scope.show = ->
        $state.transitionTo 'show_mail_application', id: mailAppId
      $scope.edit = ->
        $state.transitionTo 'edit_mail_application', id: mailAppId