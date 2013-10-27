angular.module('app.resources.mail_applications', [])
  .factory 'mailApplications', (railsResourceFactory) ->
    railsResourceFactory
      url: Routes.api_mail_applications_path()
      name: 'mailApplication'