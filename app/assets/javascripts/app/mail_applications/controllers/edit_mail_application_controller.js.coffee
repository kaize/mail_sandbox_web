angular.module('app.modules.mail_applications.controllers')
  .controller 'EditMailApplicationController',
    ($scope, mailApplications, notifications, $state, $stateParams) ->
      mailApplications.get($stateParams.id).then (mailApp)->
        $scope.mailApp = mailApp

      $scope.save = ->
        $scope.form.errors = null
        notifications.clear()

        $scope.mailApp.update().then(
          -> notifications.notice('User has successfully updated!')
        , (response) -> $scope.form.errors = response.data.errors
        )