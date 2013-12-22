angular.module('app').config ($stateProvider, $locationProvider) ->
  $locationProvider.html5Mode(true)

  $stateProvider
    .state('mail_applications',
      url: "/mail_applications"
      templateUrl: RouterHelper.templateUrl('mail_applications/index')
      controller: 'ListMailApplicationsController'
    )
    .state('new_mail_application',
      url: '/mail_applications/new'
      templateUrl: RouterHelper.templateUrl('mail_applications/new')
      controller: 'NewMailApplicationController'
    )
    .state('edit_mail_application',
      url: '/mail_applications/{id}/edit'
      templateUrl: RouterHelper.templateUrl('mail_applications/edit')
      controller: 'EditMailApplicationController'
    )
    .state('show_mail_application',
      url: '/mail_applications/{id}'
      templateUrl: RouterHelper.templateUrl('mail_applications/show')
      controller: 'ShowMailApplicationController'
    )
    .state('raw_mail_message',
      url: '/mail_applications/{mail_application_id}/mail_messages/{id}/raw'
      templateUrl: RouterHelper.templateUrl('mail_messages/raw')
      controller: 'RawMailMessageController'
    )
    .state('without_bootstrap_mail_message',
      url: '/mail_applications/{mail_application_id}/mail_messages/{id}/without_bootstrap'
      templateUrl: RouterHelper.templateUrl('mail_messages/without_bootstrap')
      controller: 'WithoutBootstrapMailMessageController'
    )
    .state('show_mail_application.show_mail_message',
      url: '/mail_messages/{mail_message_id}'
      templateUrl: RouterHelper.templateUrl('mail_messages/show')
      controller: 'ShowMailMessageController'
    )
