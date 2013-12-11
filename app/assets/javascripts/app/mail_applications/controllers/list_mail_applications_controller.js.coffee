angular.module('app.modules.mail_applications.controllers')
  .controller 'ListMailApplicationsController',
    ($scope, mailApplications, $state, $stateParams, _) ->
      $scope.mailApplicationsLoading = true

      mailApplications.get().then (results) ->
        $scope.mailApplications = results

        $scope.mailApplicationsLoading = false

      $scope.new = ->
        $state.transitionTo 'new_mail_application'
      $scope.show = (mailApp) ->
        $state.transitionTo 'show_mail_application', id: mailApp.id
      $scope.edit = (mailApp) ->
        $state.transitionTo 'edit_mail_application', id: mailApp.id
      $scope.destroy = (mailApp) ->
        deleteMailApp = confirm('Are you sure you want to delete app and all messages?')
        if deleteMailApp
          mailApp.delete().then ->
            $scope.mailApplications = _.reject($scope.mailApplications, (app) ->
              app == mailApp
            )