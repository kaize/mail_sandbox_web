angular.module('app.modules.mail_applications.controllers')
  .controller 'EditMailApplicationController',
    ($scope, mailApplications, $state, $stateParams) ->
      console.log("edit")