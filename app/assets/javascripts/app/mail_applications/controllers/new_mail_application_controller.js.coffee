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
          (responce) -> $state.transitionTo 'edit_mail_application', id: responce.id,
          (response) -> $scope.form.errors = response.data.errors
        )

      $scope.cancel = ->
        $state.transitionTo 'mail_applications'

