angular.module('app.modules.mail_applications.controllers')
  .controller 'MenuMailApplicationController',
    ($scope, mailApplications, $state, $stateParams) ->

      mailApplications.get($stateParams.id).then (mailApp)->
        $scope.mailApp = mailApp

      $scope.show = ->
        $state.transitionTo 'show_mail_application', id: $stateParams.id
      $scope.edit = ->
        $state.transitionTo 'edit_mail_application', id: $stateParams.id
      $scope.destroy = ->
        deleteMailApp = confirm('Are you sure you want to delete app and all messages?')
        if deleteMailApp
          $scope.mailApp.delete().then ->
            $state.transitionTo 'mail_applications'
