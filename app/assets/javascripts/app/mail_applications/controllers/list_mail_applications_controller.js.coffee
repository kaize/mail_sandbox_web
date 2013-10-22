angular.module('app.modules.mail_applications.controllers')
  .controller 'ListMailApplicationsController',
    ($scope, mailApplications, $state, $stateParams, _) ->
      $scope.items = mailApplications.query()

      $scope.new = ->
        $state.transitionTo 'new_mail_application'
      $scope.show = (mailApp) ->
        $state.transitionTo 'show_mail_application', id: mailApp.id
      $scope.edit = (mailApp) ->
        $state.transitionTo 'edit_mail_application', id: mailApp.id