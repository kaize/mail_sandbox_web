angular.module('app.modules.mail_applications.controllers')
  .controller 'ListMailApplicationsController',
    ($scope, mailApplications, $state, _) -> $scope.items = mailApplications.query()