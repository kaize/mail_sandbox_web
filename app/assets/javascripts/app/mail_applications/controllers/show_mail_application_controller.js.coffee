angular.module('app.modules.mail_applications.controllers')
  .controller 'ShowMailApplicationController',
    ($scope, mailApplications, $state, $stateParams) ->
      mailApplications.get($stateParams.id).then (mailApp)->
        $scope.mailApp = mailApp