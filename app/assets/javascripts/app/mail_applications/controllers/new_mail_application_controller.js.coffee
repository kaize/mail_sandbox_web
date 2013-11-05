angular.module('app.modules.mail_applications.controllers')
  .controller 'NewMailApplicationController',
    ($scope, mailApplications, Users, $state, $stateParams, notifications) ->
      $scope.mailApp = {}

      Users.get().then (results)->
        $scope.users = results.users
        $scope.members = []

      $scope.save = ->
        $scope.form.errors = null
        notifications.clear()

        $scope.mailApp.member_ids = $scope.members

        mailApp = new mailApplications($scope.mailApp)

        mailApp.create().then(
          -> notifications.notice('Mail Application has been successfully created!')
        , (response) -> $scope.form.errors = response.data.errors
        )