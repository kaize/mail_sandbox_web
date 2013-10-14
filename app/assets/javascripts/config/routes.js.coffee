angular.module('app').config ($stateProvider, $urlRouterProvider) ->
  $urlRouterProvider.otherwise "/"

  $stateProvider
    .state('show_mail_application',
      url: '/mail_applications/{id}'
      templateUrl: RouterHelper.templateUrl('mail_applications/show')
      controller: 'ShowMailApplicationController'
    )